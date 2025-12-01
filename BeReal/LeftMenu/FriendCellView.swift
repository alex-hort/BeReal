//
//  FriendCellView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack{
            Image("pp")
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 65)
                .cornerRadius(65/2)
            
            VStack(alignment: .leading){
                Text("Pao")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
                Text("pao1")
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Image(systemName: "xmark")
                .foregroundStyle(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

#Preview {
    FriendCellView()
}
