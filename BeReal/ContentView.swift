//
//  ContentView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 28/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var width = UIScreen.main.bounds.width
    @State var menu = "feed"
    
    
    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    
    
    func simpleSucces(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
    }
    var body: some View {
        
        NavigationView{
            HStack(spacing: 0){
                LeftMenu(mainMenu: $menu)
                    .frame(width: width)
                Feed(mainMenu: $menu)
                    .frame(width: width)
                Profile(mainMenu: $menu)
                    .frame(width: width)
                    
            }
            .offset(x:menu == "left" ? width: 0)
            .offset(x: menu == "profile" ? -(width) : 0)
            .onChange(of: menu) { 
                simpleSucces()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
