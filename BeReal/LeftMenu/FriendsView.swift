//
//  FriendsView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct FriendsView: View {
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
                            Text("MY FRIENDS (21)")
                                .foregroundStyle(Color(red: 205/255, green: 204/255, blue: 209/255))
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                        
                        ForEach(1..<16){ _ in
                            FriendCellView()
                        }
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
    FriendsView()
}
