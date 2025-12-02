//
//  SelectCountryView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI
import CountryPicker

struct SelectCountryView: View {
    @Binding var countryChosen: Country?
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    private var allCountries: [Country] {
        CountryManager.shared.getCountries()
    }
    
    private var filteredCountries: [Country] {
        if searchText.isEmpty {
            return allCountries
        }
        return allCountries.filter {
            $0.localizedName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Select Country")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    List {
                        Section {
                            ForEach(filteredCountries, id: \.isoCode) { country in
                                HStack {
                                    Text("\(country.isoCode.getFlag()) \(country.localizedName) (+\(country.phoneCode))")
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    if country.isoCode == countryChosen?.isoCode {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .contentShape(Rectangle())
                                .listRowBackground(Color.black)
                                .onTapGesture {
                                    countryChosen = country
                                    dismiss()
                                }
                            }
                        } header: {
                            Text("SUGGESTED")
                                .padding(.leading, -8)
                                .font(.system(size: 12))
                        }
                       
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .searchable(text: $searchText)
                }
                .padding(.top)
                
            }
            .environment(\.colorScheme, .dark)
        }
    }
}

#Preview {
    SelectCountryView(countryChosen: .constant(nil))
}
