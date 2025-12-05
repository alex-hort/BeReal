//
//  EnterCodeView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI
import Combine
import CountryPicker

struct EnterCodeView: View {

    @State var buttonActive = false
    
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject var aVM: AuthenticationVM
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                VStack{
                    HStack{
                        Spacer()
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack{
                    VStack{
                        VStack(alignment: .center, spacing: 8){
                            
                            Text("Enter the code we sent to +\(aVM.country.isoCode.getFlag()) \(aVM.phoneNumber)")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                            
                            Text(".....")
                                .foregroundStyle(aVM.otpText.isEmpty ? .gray : .black)
                                .opacity(0.8)
                                .font(.system(size: 70))
                                .padding(.top, -40)
                                .overlay {
                                    
                                    TextField("", text: $aVM.otpText)
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 24, weight: .heavy))
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(aVM.otpText)) { newValue in
                                            
                                            // Filtrar solo números
                                            let digitsOnly = newValue.filter { "0123456789".contains($0) }
                                            
                                            // Limitar a 6 dígitos
                                            let limited = String(digitsOnly.prefix(6))
                                            
                                            // Actualizar si cambió
                                            if limited != newValue {
                                                aVM.otpText = limited
                                            }
                                        }
                                }
                            
                            Spacer()
                        }
                        .padding(.top, 50)
                    }
                    
                    VStack{
                        Text("Change the phone number")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                        Button {
                            if buttonActive{
                                Task{
                                    await aVM.verifyOtp()
                                }
                            }
                        } label: {
                            WhiteButtonView(
                                buttonActive: $buttonActive,
                                text: aVM.otpText.count == 6 ? "Continue" : "Resend in \(timeRemaining)s"
                            )
                        }
                        .disabled(!buttonActive)
                        .onChange(of: aVM.otpText) { _, _ in
                            buttonActive = aVM.otpText.count == 6
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    buttonActive = true
                }
            }
            
        }
        
    }
    
}

#Preview {
    EnterCodeView()
}
