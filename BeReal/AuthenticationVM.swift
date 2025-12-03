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
            
            self.isLoading = false
            let user = result.user
            print(user.uid)
        } catch{
            print("Error")
            handleError(error: error
                .localizedDescription)
        }
    }
}
