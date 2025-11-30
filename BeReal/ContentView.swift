//
//  ContentView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 28/11/25.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
       Feed()
    }
}

#Preview {
    ContentView()
}
