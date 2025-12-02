//
//  Profile.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 29/11/25.
//

import SwiftUI

struct Profile: View {
    @Binding var mainMenu: String
    
    var body: some View {
        
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                VStack{
                    HStack{
                        Button{
                            withAnimation {
                                self.mainMenu = "feed"
                            }

                           
                        }label: {
                            Image(systemName: "arrow.backward")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                        }
                        
                        Spacer()
                        
                        
                        Text("Profile")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        ThreeDots(size: 4, color: .white)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                VStack{
                    Image("me")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .cornerRadius(75)
                    Text("Ale")
                        .foregroundStyle(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Text("alex-hort")
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Text("Your Memories")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                        HStack(spacing: 4){
                            Image(systemName: "lock.fill")
                                .foregroundStyle(.gray)
                                .font(.system(size: 10))
                            
                            Text("Only Visible to you")
                                .foregroundStyle(.gray)
                                .font(.system(size: 10))
                        }
                        .padding(.horizontal)
                        .padding(.top, 4)
                        
                        
                    }
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius:16)
                                .foregroundStyle(Color.white)
                                .opacity(0.07)
                                .frame(height: 230)
                            
                            VStack{
                                HStack{
                                    Text("Last 3 days")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16))
                                        .padding(.top,8)
                                    Spacer()
                                }
                                .padding(.leading)
                               
                                VStack{
                                    HStack(spacing: 4){
                                        ForEach(1..<8){ x in
                                            MemoryView(day: x)
                                        }
                                    }
                                    HStack(spacing: 4){
                                        ForEach(1..<8){ x in
                                            MemoryView(day: x + 7)
                                        }
                                    }
                                    .padding(.top, -4)
                                }
                                .padding(.top, -4)
                                
                                Text("View all my Memories")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 13))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.gray,lineWidth: 2)
                                            .frame(width: 175, height: 20)
                                            .opacity(0.5)
                                    )
                                    .padding(.top ,4)
                            }
                            .padding(.top, -15)
                        }
                    }
                    
                    Text("🔗 BeReal.al/alex-hort")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                        .padding(.top, 8)
                    Spacer()
                   
                }
                .padding(.top, 35)
               
            }
        }
        
    }
}

#Preview {
    Profile(mainMenu: .constant("profile"))
}
