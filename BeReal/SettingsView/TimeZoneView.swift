//
//  TimeZoneView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct TimeZoneView: View {
    @Environment(\.dismiss) var dismiss
    @State var area = "americas"
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                
                VStack{
                    ZStack{
                        Text("Time Zone")
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
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                
                VStack{
                    
                    VStack{
                        HStack{
                            Text("Select your Time Zone")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            
                            Spacer()
                        }
                        
                        HStack{
                            Text("To receive your BeReal notification during daytime, select your time zone. When changing your time zone, your current BeReal will be deleted. You can only time zones once a day.")
                                .foregroundStyle(.white)
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.top, -8)
                    }
                    
                    VStack{
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 190)
                                .foregroundStyle(Color.white)
                                .opacity(0.07)
                            
                            VStack{
                                Button {
                                    self.area = "europe"
                                } label: {
                                    HStack{
                                        Image(systemName: "globe.europe.africa.fill")
                                            .foregroundStyle(.white)
                                        Text("Europe")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        
                                      Spacer()
                                        
                                        if area == "europe"{
                                            Image(systemName: "checkmark.circle")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundStyle(.gray)
                                    
                                    
                                }
                                
                                Button {
                                    self.area = "americas"
                                } label: {
                                    HStack{
                                        Image(systemName: "globe.americas.fill")
                                            .foregroundStyle(.white)
                                        Text("Americas")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        
                                      Spacer()
                                        
                                        if area == "americas"{
                                            Image(systemName: "checkmark.circle")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundStyle(.gray)
                                }
                                
                                Button {
                                    self.area = "eastasia"
                                } label: {
                                    HStack{
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundStyle(.white)
                                        Text("Asia")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        
                                      Spacer()
                                        if area == "eastasia"{
                                            Image(systemName: "checkmark.circle")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                        .opacity(0.4)
                                        .foregroundStyle(.gray)
                                }
                                
                                Button {
                                    self.area = "westasia"
                                } label: {
                                    HStack{
                                        Image(systemName: "globe.asia.australia.fill")
                                            .foregroundStyle(.white)
                                        Text("West Asia")
                                            .foregroundStyle(.white)
                                            .fontWeight(.semibold)
                                        
                                      Spacer()
                                        
                                        if area == "westasia"{
                                            Image(systemName: "checkmark.circle")
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                        
                                    }
                                    .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                    .frame(height: 30)
                                }
                              

                            }
                        }
                        .padding(.top)
                    }
                    Spacer()
                    Button {
                        
                    }label: {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: UIScreen.main.bounds.width * 0.9 , height: 45)
                            .foregroundStyle(Color(red: 86/255, green: 86/255, blue: 88/255))
                            .overlay {
                                Text("Save")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 14))
                            }
                            
                    }
                }
                .padding(.top, 50)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    TimeZoneView()
}
