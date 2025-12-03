//
//  AuthenticationVM.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import Foundation
import CountryPicker


class AuthenticationVM: ObservableObject{
    
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var country: Country = Country(isoCode: "MX")
    @Published var phoneNumber = ""
    
    @Published var otpText = ""
    
    
    @Published var navigationTag: String?
    
    func sendfOtp(){
        self.navigationTag = "VERIFICATION"
    }
}
