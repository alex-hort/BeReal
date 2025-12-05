//
//  Feed.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 28/11/25.
//

import SwiftUI
import Foundation

struct Feed: View {
    
    @Binding var mainMenu: String
    
    @EnvironmentObject var viewModel: AuthenticationVM
    
    var body: some View {
        ZStack{
            ///background complete black
            Color.black.ignoresSafeArea()
            
            ZStack{
                
                ScrollView{
                VStack{
                    VStack{
                        ZStack{
                            VStack(alignment: .leading){
                                Image("a")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                            }
                            
                            VStack{
                                HStack{
                                    Image("pp")
                                        .resizable()
                                        .scaledToFit()
                                        .border(.black)
                                        .cornerRadius(2)
                                        .frame(width: 20, height: 40)
                                        .padding(.leading)
                                    Spacer()
                                }
                                .padding(.top, 18)
                                Spacer()
                            }
                        }
                        .frame(width: 100)
                    }
                    
                    VStack{
                        Text("Add a caption...")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        Text("View Comment")
                            .foregroundStyle(.gray)
                        
                        
                        HStack{
                            Text("Los Angeles, CA • 3 hr late")
                                .foregroundStyle(.gray)
                                .font(.system(size: 12))
                            ThreeDots(size: 3, color: .gray)
                        }
                    }
                    ForEach(1..<8){ _ in
                        FeedCell()
                    }
                }
                .padding(.top, 80)
            }
                
                VStack{
                    VStack{
                        HStack{
                            
                            Button{
                                withAnimation {
                                    self.mainMenu = "left"
                                }
                               
                            }label: {
                                Image(systemName: "person.2.fill")
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            Text("BeReal.")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                            
                            Spacer()
                            //profile image
                            Button{
                                withAnimation {
                                    self.mainMenu = "profile"
                                }
                            }label: {
                                Circle()
                                    .frame(width: 35, height: 35)
                                    .cornerRadius(17.5)
                                    .foregroundStyle(Color(red: 152/255, green: 163/255, blue: 16/255))
                                    .overlay {
                                       
                                        if let user = viewModel.currentUser{
                                            Text(user.name.prefix(1).uppercased())
                                                .foregroundStyle(.white)
                                                .font(.system(size: 15))
                                        } else {
                                            ProgressView()
                                        }
                                       
                                    }
                                
                                
//                                Image("me")
//                                    .resizable()
//                                    .frame(width: 35, height: 35)
//
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            Text("My Friends")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                            
                            Text("Discovery")
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Feed(mainMenu: .constant("feed"))
}
