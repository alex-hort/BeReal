//
//  NotificationsButtonView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI

struct NotificationsButtonView: View {
    var icon: String
    var text: String
    
    @Binding var toggle: Bool
    
    var body: some View {
       
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 45)
                .foregroundStyle(Color(red: 28/255, green: 28/255, blue: 30/255))
            
            
            HStack{
                Image(systemName: icon)
                    .foregroundStyle(.white)
                
                Text(text)
                    .foregroundStyle(.white)
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                
                Spacer()
                
                Toggle("", isOn: $toggle)
            }
            .padding(.horizontal)
            .frame(height: 30)
        }
       
        
        
    }
}

#Preview {
    NotificationsButtonView(icon: "face.smiling.fill", text: "RealMoji", toggle: .constant(false))
}
