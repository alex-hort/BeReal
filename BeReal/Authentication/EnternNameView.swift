//
//  EnternNameView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI

struct EnternNameView: View {
    
    @State var name = ""
    @State var buttonActive = false
    @EnvironmentObject var aVM: AuthenticationVM
    
    @Binding var nameButtonClicked: Bool
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
                    .padding(.vertical, -5)
                    Spacer()
                }
                
                VStack{
                    VStack{
                        Text("Let's get started, what's your name?")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                        
                        TextField("Your name", text: $name)
                            .foregroundStyle(.white)
                            .font(.system(size: 40, weight: .heavy))
                            .multilineTextAlignment(.center)
                            .frame(width: 210)
                            .overlay {
                                TextField("", text: $name)
                                    .font(.system(size: 40, weight: .heavy))
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                            }
                            

                        
                    }
                    .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.top, 50)
                
                VStack{
                    Spacer()
                    
                    Button{
                        if buttonActive{
                            nameButtonClicked = true
                        }
                    
                    }label: {
                        WhiteButtonView(buttonActive: $buttonActive , text: "Continue")
                        
                            .onChange(of: name) {
                                if !name.isEmpty{
                                    buttonActive = true
                                } else if name.isEmpty{
                                    buttonActive = false
                                }
                            }
                    }
                   
                }
                .padding(.bottom, 25)
                
                
            }
        }
    }
}

//#Preview {
//    EnternNameView()
//}
