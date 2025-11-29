//
//  FeedCell.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 28/11/25.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading){
                
                ///USERNAME
                HStack{
                    Image("me")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading){
                        Text("alex-hort")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 16))
                        
                        Text("Los Angeles, CA • 8 hr late")
                            .foregroundStyle(.white)
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal)
                ///IMAGE
                
                ZStack{
                    
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName: "bubble.left.fill")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3,x: 1,y: 1)
                                
                                Image(systemName: "face.smiling.fill")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 25))
                                    .shadow(color: .black, radius: 3,x: 1,y: 1)
                                    .padding(.top, 15)
                                    
                            }
                            .padding(.trailing, 15)
                            .padding(.bottom, 50)
                        }
                    }
                    .zIndex(1)
                    
                    
                    VStack{
                        Image("h")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                        
                        HStack{
                            Text("Add a comment...")
                                .foregroundStyle(.gray)
                                .fontWeight(.semibold)
                                .padding(.leading, 10)
                            Spacer()
                        }
                    }
                    
                    VStack{
                        HStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.black)
                                .frame(width: 105, height: 125)
                                .overlay (
                                    
                                    Image("a")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(8)
                                        .frame(width: 100, height: 155)
                                )
                                .padding(.leading)
                            
                            Spacer()
                        }
                        .padding(.top,18)
                        Spacer()
                    
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width, height: 600)
            }
        }
    }


#Preview {
    FeedCell()
}
