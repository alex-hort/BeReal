//
//  EnterAgeView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI

struct EnterAgeView: View {
    
    @State var month = ""
    @State var day = ""
    @State var year = ""
    @State var buttonActive = false
    
    @Binding var ageButtonClicked: Bool
   
    @EnvironmentObject var aVM: AuthenticationVM
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("BeReal.")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Hi, when's your birthay?")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 16))
                    
                    HStack(spacing: 4) {
                        
                        // ---------- MONTH ----------
                        ZStack {
                            if month.isEmpty {
                                Text("MM")
                                    .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                                    .font(.system(size: 40, weight: .heavy))
                            }
                            
                            TextField("", text: $month)
                                .foregroundStyle(.white)
                                .font(.system(size: 45, weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onChange(of: month) {
                                    month = month.filter { $0.isNumber }
                                    if month.count > 2 { month = String(month.prefix(2)) }
                                }
                        }
                        .frame(width: 72)
                        
                        // ---------- DAY ----------
                        ZStack {
                            if day.isEmpty {
                                Text("DD")
                                    .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                                    .font(.system(size: 40, weight: .heavy))
                            }
                            
                            TextField("", text: $day)
                                .foregroundStyle(.white)
                                .font(.system(size: 45, weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onChange(of: day) {
                                    day = year.filter { $0.isNumber }
                                    if day.count > 2 { day = String(day.prefix(2)) }
                                }
                        }
                        .frame(width: 72)
                        
                        // ---------- YEAR ----------
                        ZStack {
                            if year.isEmpty {
                                Text("YYYY")
                                    .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                                    .font(.system(size: 40, weight: .heavy))
                            }
                            
                            TextField("", text: $year)
                                .foregroundStyle(.white)
                                .font(.system(size: 45, weight: .heavy))
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                                .onChange(of: year) {
                                    year = year.filter { $0.isNumber }
                                    if year.count > 4 { year = String(year.prefix(4)) }
                                }
                        }
                        .frame(width: 120)
                    }
                    Spacer()
                    
                    
                    VStack{
                        
                        
                        Text("Only to make sure you're old enough to use BeReal.")
                            .foregroundStyle(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                    
                    Button{
                        if buttonActive{
                            ageButtonClicked = true
                        }
                    }label: {
                        WhiteButtonView(buttonActive: $ageButtonClicked, text: "Continue")
                            .padding(.bottom, 50)
                            .onChange(of: month) { oldValue, newValue in
                                if !newValue.isEmpty{
                                    buttonActive = true
                                } else if newValue.isEmpty{
                                    buttonActive = false
                                }
                            }
                    }
                }
                .padding(.top, 50)
                
                
                
                
                
                
            }
            
            
        }
    }
}


