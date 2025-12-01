//
//  LeftMenu.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct LeftMenu: View {
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                LeftMenuTopView()
                FriendsView()
            }
        }
    }
}

#Preview {
    LeftMenu()
}
