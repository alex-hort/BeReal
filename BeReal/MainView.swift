//
//  MainView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 04/12/25.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthenticationVM
    
    
    
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                MainAuthenticationView()
            }
            else {
                ContentView()
            }
        }
    }
}

#Preview {
    MainView()
}
