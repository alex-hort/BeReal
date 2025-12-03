//
//  EnterCodeView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI
import Combine

struct EnterCodeView: View {
    @State var otpCode = ""
    @State var buttonActive = false
    
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                            
                            Text("Enter the code we sent to + 56 58 78 46 44")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                            
                            Text(".....")
                                .foregroundStyle(otpCode.isEmpty ? .gray : .black)
                                .opacity(0.8)
                                .font(.system(size: 70))
                                .padding(.top, -40)
                                .overlay {
                                    
                                    TextField("", text: $otpCode)
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 24, weight: .heavy))
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(otpCode)) { newValue in
                                            
                                            // Filtrar solo números
                                            let digitsOnly = newValue.filter { "0123456789".contains($0) }
                                            
                                            // Limitar a 6 dígitos
                                            let limited = String(digitsOnly.prefix(6))
                                            
                                            // Actualizar si cambió
                                            if limited != newValue {
                                                otpCode = limited
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
                            
                        } label: {
                            WhiteButtonView(
                                buttonActive: $buttonActive,
                                text: otpCode.count == 6 ? "Continue" : "Resend in \(timeRemaining)s"
                            )
                        }
                        .disabled(!buttonActive)
                        .onChange(of: otpCode) { _, _ in
                            buttonActive = otpCode.count == 6
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    buttonActive = true // Puedes volver a activar resend
                }
            }
            
        }
        
    }
    
}

#Preview {
    EnterCodeView()
}
