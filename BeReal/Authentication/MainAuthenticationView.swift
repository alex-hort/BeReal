//
//  MainAuthenticationView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI

struct MainAuthenticationView: View {
    
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneNumberClicked = false
    
    @StateObject var viewModel = AuthenticationVM()
    
    var body: some View {
        NavigationView{
            if !nameButtonClicked{
                EnternNameView(name: $viewModel.name,nameButtonClicked: $nameButtonClicked)
                    .environmentObject(viewModel)
            }
            else if nameButtonClicked && !ageButtonClicked{
                EnterAgeView(year: $viewModel.year, name: $viewModel.name,ageButtonClicked: $ageButtonClicked)
            }
            else if nameButtonClicked && ageButtonClicked && !phoneNumberClicked{
                EnterPhoneNumberView( phoneNumeberButtonClicked: $phoneNumberClicked)
                    .environmentObject(viewModel)
            }
        }
    }
}

#Preview {
    MainAuthenticationView()
}
