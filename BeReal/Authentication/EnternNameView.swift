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
                            

                        
                    }
                    .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.top, 50)
                
                VStack{
                    Spacer()
                    
                    Button{
                    
                    }label: {
                        WhiteButtonView(buttonActive: $buttonActive , text: "Continue")
                        
                            .onChange(of: name) { newValue in
                                if !newValue.isEmpty{
                                    buttonActive = true
                                } else if newValue.isEmpty{
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

#Preview {
    EnternNameView()
}
