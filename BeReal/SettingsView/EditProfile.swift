//
//  EditProfile.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 30/11/25.
//

import SwiftUI

struct EditProfile: View {
    @State private var fullname: String = ""
    @State private var username: String = ""
    @State private var bio: String = ""
    @State private var location: String = ""
    @EnvironmentObject var viewModel: AuthenticationVM
    @Environment(\.dismiss) var dismiss
    
  
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                        
                        VStack(spacing: 0) {
                            HeaderView()
                            
                            ScrollView {
                                VStack(spacing: 24) {
                                    ProfileImageSection()
                                    
                                    VStack(spacing: 0) {
                                        ProfileFieldRow(
                                            label: "Name",
                                            text: $fullname,
                                            placeholder: viewModel.currentUser!.name
                                        )
                                        
                                        ProfileFieldRow(
                                            label: "Username",
                                            text: $username,
                                            placeholder: viewModel.currentUser!.username ?? "alex-hort"
                                        )
                                        
                                        BioFieldRow(
                                            text: $bio,
                                            placeholder: viewModel.currentUser!.bio ?? "Bio"
                                        )
                                        
                                        ProfileFieldRow(
                                            label: "Location",
                                            text: $location,
                                            placeholder: viewModel.currentUser!.location ?? "Location",
                                            fontSize: 12
                                        )
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, 24)
                            
                        
                  
                }
            }
        }
    }
}

// MARK: - Header
struct HeaderView: View {
    @EnvironmentObject var viewModel: AuthenticationVM
    @Environment(\.dismiss) var dismiss
    @State private var fullname: String = ""
    @State private var username: String = ""
    @State private var bio: String = ""
    @State private var location: String = ""
    
    private func saveData(){
        if viewModel.currentUser!.name != self.fullname && self.fullname.isEmpty{
            viewModel.currentUser!.name = self.fullname
        }
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button {
                        saveData()
                        dismiss()
                    }label:{
                       Text("Save")
                            .foregroundStyle(.gray)
                    }
                        
                }
                .padding(.horizontal, 20)
                
                Text("Edit Profile")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            .padding(.vertical, 12)
            
            Divider()
                .background(Color.gray.opacity(0.5))
                .padding(.horizontal, 4)
        }
    }
}

// MARK: - Profile Image Section
struct ProfileImageSection: View {
    @EnvironmentObject var viewModel: AuthenticationVM
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Circle()
                .frame(width: 35, height: 35)
                .cornerRadius(17.5)
                .foregroundStyle(Color(red: 152/255, green: 163/255, blue: 16/255))
                .overlay {
                   
                    if let user = viewModel.currentUser{
                        Text(user.name.prefix(1).uppercased())
                            .foregroundStyle(.white)
                            .font(.system(size: 15))
                    } else {
                        ProgressView()
                    }
                   
                }
            
            CameraButton()
        }
    }
}

struct CameraButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 34, height: 34)
            
            Circle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
            
            Circle()
                .fill(Color.black.opacity(0.1))
                .frame(width: 30, height: 30)
            
            Image(systemName: "camera.fill")
                .font(.system(size: 16))
                .foregroundStyle(.black)
                .shadow(color: .white, radius: 1, x: 1, y: 1)
        }
    }
}



struct ProfileFieldRow: View {
    let label: String
    @Binding var text: String
    let placeholder: String
    var fontSize: CGFloat = 16
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color.gray.opacity(0.3))
            
            HStack(spacing: 20) {
                Text(label)
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .frame(width: 90, alignment: .leading)
                
                TextField("", text: $text, prompt: Text(placeholder)
                    .foregroundStyle(.gray)
                    .fontWeight(.light)
                    .font(.system(size: fontSize)))
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
            }
            .padding(.vertical, 12)
        }
    }
}
struct BioFieldRow: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color.gray.opacity(0.3))
            
            HStack(alignment: .top, spacing: 20) {
                Text("Bio")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .frame(width: 90, alignment: .leading)
                    .padding(.top, 8)
                
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text(placeholder)
                            .foregroundStyle(.gray)
                            .font(.system(size: 16))
                            .padding(.top, 8)
                            .padding(.leading, 5)
                    }
                    
                    TextEditor(text: $text)
                        .foregroundStyle(.white)
                        .scrollContentBackground(.hidden)
                        .frame(height: 100)
                }
            }
            .padding(.vertical, 12)
        }
    }
}




