//
//  Settings.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 29/11/25.
//

import SwiftUI

struct Settings: View {
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Color.black.ignoresSafeArea()
                    
                    VStack{
                        ZStack{
                            Text("Settings")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                            HStack{
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        Spacer()
                        
                    }
                    
                    VStack{
                        NavigationLink {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 90)
                                .foregroundStyle(.white)
                                .opacity(0.07)
                                .overlay {
                                    HStack{
                                        Image("me")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(30)
                                        
                                        VStack(alignment: .leading){
                                            Text("Ale")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 18))
                                            
                                            Text("alex-hort")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .font(.system(size: 14))
                                        }
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.horizontal, 18)
                                }
                        }

                        
                        VStack(spacing: 6){
                            HStack{
                                Text("FEACTURES")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, width * 0.05)
                                Spacer()
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: width * 0.9, height: 45)
                                    .foregroundStyle(.white)
                                    .opacity(0.07)
                                
                                HStack{
                                    Image(systemName: "calendar")
                                        .foregroundStyle(.white)
                                    
                                    Text("Memories")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 14))
                                    
                                }
                                .padding(.horizontal, width * 0.1)
                                .frame(height: 30)
                            }
                        }
                        .padding(.top, 12)
                        
                        
                        VStack(spacing: 6){
                            HStack{
                                Text("SETTINGS")
                                    .foregroundStyle(.gray)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 12))
                                    .padding(.horizontal, width * 0.05)
                                Spacer()
                                
                                
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width: width * 0.9, height: 145)
                                    .foregroundStyle(.white)
                                    .opacity(0.07)
                                
                                VStack {
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack{
                                            Image(systemName: "square.and.pencil")
                                                .foregroundStyle(.white)
                                            
                                            Text("Notifications")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    
                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundStyle(.gray)
                                    
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack{
                                            Image(systemName: "globe.europe.africa.fill")
                                                .foregroundStyle(.white)
                                            
                                            Text("Time Zone: Americas")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundStyle(.gray)
                                    
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack{
                                            Image(systemName: "hammer.circle")
                                                .foregroundStyle(.white)
                                            
                                            Text("Other")
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    
                                }
                            }
                            .padding(.top, 12)
                            
                            VStack(spacing: 6){
                                HStack{
                                    Text("ABOUT")
                                        .foregroundStyle(.gray)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                        .padding(.horizontal, width * 0.05)
                                    Spacer()
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 14)
                                        .frame(width: width * 0.9, height: 190)
                                        .foregroundStyle(.white)
                                        .opacity(0.07)
                                    
                                    VStack {
                                        NavigationLink {
                                            
                                        } label: {
                                            HStack{
                                                Image(systemName: "square.and.arrow.up")
                                                    .foregroundStyle(.white)
                                                
                                                Text("Share BeReal")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 14))
                                            }
                                            .padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                        }
                                        
                                        
                                        Rectangle()
                                            .frame(width: width * 0.9, height: 0.3)
                                            .opacity(0.4)
                                            .foregroundStyle(.gray)
                                        
                                        
                                        NavigationLink {
                                            
                                        } label: {
                                            HStack{
                                                Image(systemName: "star")
                                                    .foregroundStyle(.white)
                                                
                                                Text("Rate BeReal")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 14))
                                            }
                                            .padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                        }
                                        Rectangle()
                                            .frame(width: width * 0.9, height: 0.3)
                                            .opacity(0.4)
                                            .foregroundStyle(.gray)
                                        
                                        
                                        NavigationLink {
                                            
                                        } label: {
                                            HStack{
                                                Image(systemName: "lifepreserver")
                                                    .foregroundStyle(.white)
                                                
                                                Text("Help")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 14))
                                            }
                                            .padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                        }
                                        Rectangle()
                                            .frame(width: width * 0.9, height: 0.3)
                                            .opacity(0.4)
                                            .foregroundStyle(.gray)
                                        
                                        
                                        NavigationLink {
                                            
                                        } label: {
                                            HStack{
                                                Image(systemName: "info.circle")
                                                    .foregroundStyle(.white)
                                                
                                                Text("About")
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.semibold)
                                                
                                                Spacer()
                                                
                                                Image(systemName: "chevron.right")
                                                    .foregroundStyle(.gray)
                                                    .font(.system(size: 14))
                                            }
                                            .padding(.horizontal, width * 0.1)
                                            .frame(height: 30)
                                        }
                                        
                                        
                                    }
                                    
                                }
                                .padding(.top, 12)
                                
                                
                                ///Logout
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: width * 0.9,  height: 45)
                                        .foregroundStyle(.white)
                                        .opacity(0.07)
                                    
                                    Button {
                                        
                                    } label: {
                                        HStack{
                                            Spacer()
                                            Text("Log Out")
                                                .foregroundStyle(.red)
                                            Spacer()
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }

                                    
                                    
                                }
                                .padding(.top, 12)
                                
                                
                                ///version text
                                Text("Version 0.1 (8183) - Production")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.top, 12)
                            }
                        }
                        
                        
                    }
                    .toolbarVisibility(.hidden)
                }
            }
        }
    }
}
        
        
    

#Preview {
    Settings()
}
