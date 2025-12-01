//
//  LeftMenu.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct LeftMenu: View {
    @State var widh = UIScreen.main.bounds.width
    @State var menu = "suggestions"
    
    
    var body: some View {

        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                LeftMenuTopView()
                
                if menu == "suggestions" {
                    Suggestions()
                }
                else if menu == "friends" {
                    FriendsView()
                }
                else if menu == "request"{
                    RequestView()
                }
                
                
                VStack{
                    Spacer()
                    ZStack{
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: widh * 0.7, height: 40)
                                    .foregroundStyle(Color(red: 20/255, green: 20/255, blue: 20/255))
                                
                                HStack(spacing: 4){
                                    Capsule()
                                        .frame(width: 100, height: 28)
                                        .foregroundStyle(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "suggestions" ? 1: 0)
                                        .overlay {
                                            Text("Suggestions")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 14))
                                            
                                        }
                                        .onTapGesture {
                                            menu = "suggestions"
                                        }
                                        
                                    
                                    Capsule()
                                        .frame(width: 70, height: 28)
                                        .foregroundStyle(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "friends" ? 1: 0)
                                        .overlay {
                                            Text("Friends")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 14))
                                                
                                        }
                                        .onTapGesture {
                                            menu = "friends"
                                        }
                                    
                                    Capsule()
                                        .frame(width: 75, height: 28)
                                        .foregroundStyle(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "request" ? 1: 0)
                                        .overlay {
                                            Text("Request")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            menu = "request"
                                        }
                                }
                            }
                        }
                        .zIndex(1)
                        
                        LinearGradient(colors: [Color.white.opacity(0)], startPoint: .bottom, endPoint: .top)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .opacity(0.9)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LeftMenu()
}
