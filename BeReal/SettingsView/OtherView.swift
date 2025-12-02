//
//  OtherView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct OtherView: View {
    @Environment(\.dismiss) var dismiss
    @State var fastCamera = false
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                // TOP BAR
                ZStack {
                    Text("Other")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)

                    HStack {
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "arrow.backward")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                        }
                        Spacer()
                    }
                }
                .padding()

              

                // BOTTOM CONTENT
                VStack(spacing: 14) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color(red: 28/255, green: 28/255, blue: 30/255))

                        HStack {
                            Image(systemName: "camera.viewfinder")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 14))

                            Text("Fast Camera (reduces quality)")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 14))

                            Toggle("", isOn: $fastCamera)
                        }
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                        .frame(height: 30)
                        .padding(.horizontal)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color(red: 28/255, green: 28/255, blue: 30/255))

                        HStack {
                            Image(systemName: "xmark.app")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 14))

                            Text("Clear cache")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 14))

                          Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.white)
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                        .frame(height: 30)
                        .padding(.horizontal)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 45)
                            .foregroundStyle(Color(red: 28/255, green: 28/255, blue: 30/255))

                        HStack {
                           Text("Delete Account")
                                .foregroundStyle(.red)
                                
                        }
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                        .frame(height: 30)
                        .padding(.horizontal)
                    }
                }
                .padding()
                Spacer()
            
            }
        
        }
        
    }

}

#Preview {
    OtherView()
}
