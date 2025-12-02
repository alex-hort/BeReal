//
//  HelpView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Text("Help")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        HStack{
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                
                VStack{
                    VStack(spacing: 16){
                        NavigationLink{
                            ContactUsView().navigationBarBackButtonHidden()
                        }label: {
                            ChevronButtonView(icon: "envelope", text: "Contact us")
                        }
                        
                        ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }
            }
            
            
        }
    }
}

#Preview {
    HelpView()
}
