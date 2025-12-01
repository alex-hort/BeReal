//
//  LeftMenuTopView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct LeftMenuTopView: View {
    
    @State var text = ""
    @State var isEditing = false
    
    var body: some View {
        VStack{
            
            ZStack{
                HStack{
                    
                    Spacer()
                    
                    Image(systemName: "arrow.forward")
                        .foregroundStyle(.white)
                }
                
                Text("BeReal.")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 22))
            }
            
            SearchBar(text: $text, isEditing: $isEditing)
            Spacer()
        }
    }
}

#Preview {
    LeftMenuTopView()
}
