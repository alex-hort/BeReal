//
//  Feed.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 28/11/25.
//

import SwiftUI

struct Feed: View {
    var body: some View {
        ZStack{
            ///background complete black
            Color.black.ignoresSafeArea()
            
            ZStack{
                VStack{
                    VStack{
                        HStack{
                            Image(systemName: "person.2.fill")
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Text("BeReal.")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                            
                            Spacer()
                            //profile image
                            Image("me")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
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
    Feed()
}
