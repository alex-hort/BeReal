//
//  EnterPhoneNumberView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI
import CountryPicker

struct EnterPhoneNumberView: View {
    
    @State var country = Country(isoCode: "MX")
    @State var showCountryList = false
    @State var phoneNumber = ""
    @State var buttonActive = false
    
    @Binding var phoneNumeberButtonClicked: Bool
    
    @EnvironmentObject var aVM: AuthenticationVM
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 10) {
                
              
                Text("BeReal.")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
                    .padding(.top,-10)
       
                VStack(spacing: 20) {
                    
                    Text("Create your account using your phone number")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
              
                    HStack(spacing: 10) {
                        HStack {
                            Text(country.isoCode.getFlag())
                            Text("+\(country.phoneCode)")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                        
                        
                        .frame(width: 90, height: 45)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.gray, lineWidth: 1)
                            
                        )
                        
                        
                        .onTapGesture {
                            showCountryList.toggle()
                        }
                        Spacer()
                     
                        TextField("Your Phone",
                                  text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .heavy))
                        .onChange(of: phoneNumber) {
                            // 1. Eliminar todo lo que NO sea número
                            let filtered = phoneNumber.filter { $0.isNumber }

                            // 2. Limitar a 10 dígitos
                            if filtered.count > 10 {
                                phoneNumber = String(filtered.prefix(10))
                            } else {
                                phoneNumber = filtered
                            }
                        }

                        
                      
                        
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.top)
                
                Spacer()
                
                VStack{
                    Text("By tapping \"Continue, you agree to our Privacy Policy Service.")
                        .foregroundStyle(.white)
                        .fontWeight(.light)
                        .opacity(0.4)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Button{
                        aVM.sendfOtp()
                        
                    }label: {
                        WhiteButtonView(buttonActive: $buttonActive, text: "Continue")
                            .onChange(of: phoneNumber) {
                                if !phoneNumber.isEmpty{
                                    buttonActive = true
                                }
                                else if phoneNumber.isEmpty{
                                    buttonActive = false
                                }
                            }
                    }
                    .padding(.bottom, 50)
                    
                    .disabled(phoneNumber.isEmpty ? true: false)
                }
            }
            
         
        }
        .sheet(isPresented: $showCountryList) {
            SelectCountryView(countryChosen: $country)
        }
//        .overlay(content: {
//            ProgressView()
//        })
        
        .background{
            NavigationLink(tag: "VERIFICATION", selection: $aVM.navigationTag){
                EnterCodeView().environmentObject(aVM)
            }label:{
               
            }
            .labelsHidden()
        }
        .environment(\.colorScheme, .dark)
    }
}


