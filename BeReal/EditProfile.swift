//
//  EditProfile.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 30/11/25.
//

import SwiftUI

struct EditProfile: View {
    @State private var fullname = ""
    @State private var username = ""
    @State private var bio = ""
    @State private var location = ""
    
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
                                label: "Full Name",
                                text: $fullname,
                                placeholder: "Alexis Horteales Espinosa"
                            )
                            
                            ProfileFieldRow(
                                label: "Username",
                                text: $username,
                                placeholder: "alex-hort"
                            )
                            
                            BioFieldRow(text: $bio)
                            
                            ProfileFieldRow(
                                label: "Location",
                                text: $location,
                                placeholder: "Location",
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
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button("Cancel") {}
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Button("Save") {}
                        .foregroundStyle(.gray)
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
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("me")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
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

// MARK: - Profile Field Row
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

// MARK: - Bio Field Row
struct BioFieldRow: View {
    @Binding var text: String
    
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
                        Text("Bio")
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



#Preview {
    EditProfile()
}
