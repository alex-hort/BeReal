//
//  AuthenticationVM.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import Foundation
import CountryPicker
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore


@MainActor
class AuthenticationVM: ObservableObject {
    
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country: Country = Country(isoCode: "MX")
    @Published var phoneNumber = ""
    
    @Published var otpText = ""
    @Published var navigationTag: String?
    
    @Published var isLoading: Bool = false
    @Published var verificationCode: String = ""
    @Published var errorMenssage = ""
    @Published var showAlert = false
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthenticationVM()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func sendfOtp() async {
        guard !isLoading else { return }
        
        do {
            isLoading = true
            
            let phoneNumberComplete = "+\(country.phoneCode)\(phoneNumber)"
            
            // Usar PhoneAuthProvider directamente
            let result = try await PhoneAuthProvider.provider()
                .verifyPhoneNumber(phoneNumberComplete, uiDelegate: nil)
            self.isLoading = false
            self.verificationCode = result
            self.navigationTag = "VERIFICATION"
            
        } catch let error as NSError {
            handleError(error: error.localizedDescription)
        }
    }
    
    
    func handleError(error: String) {
        self.isLoading = false
        self.errorMenssage = error
        self.showAlert.toggle()
    }
    
    
    func verifyOtp() async {
        do{
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationCode, verificationCode: otpText)
            
            let result = try await Auth.auth().signIn(with: credential)
            
            let db = Firestore.firestore()
            db.collection("users").document(result.user.uid).setData([
                "fullname" : name,
                "date" : year.date,
                "id": result.user.uid
            ]){
                err in
                
                if let err = err {
                    print(err.localizedDescription)
                }
            }
            
            self.isLoading = false
            let user = result.user
            self.userSession = user
            print(user.uid)
            
            
        } catch{
            print("Error")
            handleError(error: error
                .localizedDescription)
        }
    }
    
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    
    func fetchUser(){
        guard let uid = userSession?.uid else {return}
        
        Firestore.firestore().collection("users").document(uid).getDocument(){ snapshot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let user = try? snapshot?.data(as: User.self) else {return}
            self.currentUser
            
        }
        
    }
}
