//
//  MemoriesView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 01/12/25.
//

import SwiftUI

struct MemoriesView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Text("Memories")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        HStack{
                            Button{
                                dismiss()
                            }label:{
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "questionmark.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 16))
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                }
                VStack{
                    VStack{
                        HStack{
                            Text("Your memories are activated")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                            Spacer()
                        }
                        Text("All your BeReal are automatically added to your Memories and only visible by you.")
                            .foregroundStyle(.white)
                            .padding(.top, -2)
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 210)
                            .foregroundStyle(Color(red: 22/255, green: 4/255, blue: 3/255))
                        
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.red, lineWidth: 1)
                            }
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("Desactivate and Delete Memories")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            VStack{
                                HStack{
                                    
                                    Text("If you desactivate your Memoies, all your BeReal will be permanently deleted and unrecoverable.")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 14))
                                        Spacer()
                                }
                                HStack{
                                    
                                    Text("All your future BeReal won't be saved in Memories and will be automatically deleted as well.")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 14))
                                        Spacer()
                                }
                                
                            }
                            .padding(.top, -6)
                            
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: UIScreen.main
                                    .bounds.width * 0.5, height: 40)
                                .foregroundStyle(Color(red: 44/255, green: 44/255, blue: 46/255))
                                .overlay {
                                    Text("Deactivate Memories")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                }
                                .padding(.top, 8)
                            
                        }
                        .padding(.leading)
                    }
                    .padding(.top, 22)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 50)
            }
        }
    }
}

#Preview {
    MemoriesView()
}
