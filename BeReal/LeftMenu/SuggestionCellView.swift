//
//  SuggestionCellView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct SuggestionCellView: View {
    var body: some View {
        HStack{
            Image("r")
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 65)
                .cornerRadius(65/2)
            
            VStack(alignment: .leading){
                Text("James")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                Text("Jamesss The")
                    .foregroundStyle(.gray)
                
                HStack{
                    Image(systemName: "person.crop.circle")
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                    Text("James12")
                        .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        .padding(.leading, -4)
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color(red: 44/255, green: 44/255, blue: 46/255))
                .frame(width: 45, height: 25)
                .overlay {
                    Text("ADD")
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
            
            Image(systemName: "xmark")
                .foregroundStyle(.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SuggestionCellView()
}
