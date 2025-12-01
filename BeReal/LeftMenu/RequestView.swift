//
//  RequestView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct RequestView: View {
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 65)
                        .foregroundStyle(Color(red: 40/255, green: 40/255, blue: 35/255))
                        .overlay {
                            HStack{
                                
                                Image("r")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading){
                                    
                                    Text("Invite friends on BeReal")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                    
                                    Text("ber.al/alex-hort")
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                            }
                            .padding(.horizontal)
                        }
                    
                    VStack{
                        HStack{
                            Text("FINDING REQUEST (21)")
                                .foregroundStyle(Color(red: 205/255, green: 204/255, blue: 209/255))
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                            Spacer()
                            
                            HStack{
                                Text("Sent")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                                
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 14))
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        
                        RoundedRectangle(cornerRadius: 18)
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: 90)
                            .foregroundStyle(Color(red: 28/255, green: 28/255, blue: 30/255))
                            .overlay(content: {
                                
                                VStack(spacing: 8){
                                    HStack{
                                        Spacer()
                                        Text("No pending request")
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                        Spacer()
                                    }
                                    HStack{
                                        
                                        Spacer()
                                        Text("Yoi don't have any pending request.")
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                            .font(.system(size: 12))
                                        Spacer()
                                        
                                    }
                                }
                            })
                       
                        
                       
                    }
                    .padding(.top)
                    Spacer()
                }
                .padding(.top, 20)
            }
            .padding(.top, 110)
        }
    }
}

#Preview {
    RequestView()
}
