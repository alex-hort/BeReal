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
                EnternNameView( nameButtonClicked: $nameButtonClicked)
            }
            else if nameButtonClicked && !ageButtonClicked{
                EnterAgeView(ageButtonClicked: $ageButtonClicked)
            }
            else if nameButtonClicked && ageButtonClicked && !phoneNumberClicked{
                EnterPhoneNumberView( phoneNumeberButtonClicked: $phoneNumberClicked)
            }
        }
    }
}

#Preview {
    MainAuthenticationView()
}
