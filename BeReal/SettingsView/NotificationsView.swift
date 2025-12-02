//
//  NotificationsView.swift
//  BeReal
//
//  Created by Alexis Horteales Espinosa on 02/12/25.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var mentions = false
    @State var comments = false
    @State var friendRequest = false
    @State var lateBeReal = false
    @State var realMojis = false
    @State var buttonActive = false
    
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Text("Notifications")
                            .fontWeight(.semibold)
                        
                        HStack{
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: 20))
                            }
                           
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    .padding(.horizontal)
                    Spacer()
                }
                
                .foregroundStyle(.white)
                
                VStack{
                    VStack{
                       
                        HStack{
                            Text("On BeReal, you're in control of your push notifications.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        HStack{
                            Text("On BeReal, you're in control of your push notifications.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                 
                    }
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    
                    
                    VStack(spacing: 14){
                        VStack{
                            
                            NotificationsButtonView(icon: "person.crop.square.filled.and.at.rectangle", text: "Mentions", toggle: $mentions)
                            HStack{
                               Text("dilaysila mentioned you on seanlund's BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            
                            NotificationsButtonView(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                            HStack{
                               Text("alex commmented on your BeReal")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            
                            NotificationsButtonView(icon: "person.2.fill", text: "Friend request", toggle: $friendRequest)
                            HStack{
                               Text("erick just sent you a friend request")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        VStack{
                            
                            NotificationsButtonView(icon: "timer", text: "Late BeReal", toggle: $lateBeReal)
                            HStack{
                               Text("zejoshi just posted late")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        
                        VStack{
                            
                            NotificationsButtonView(icon: "face.smiling.fill", text: "RealMojis", toggle: $realMojis)
                            HStack{
                               Text("juan jus reacted to your BeReal.")
                                    .foregroundStyle(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 8)
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.top,50)
                
                VStack{
                    
                    Spacer()
                    
                    Button{
                        
                    }label: {
                       
                        WhiteButtonView(buttonActive: $buttonActive, text: "Save")
                            .onChange(of: mentions || comments || friendRequest || lateBeReal || realMojis) {
                                self.buttonActive = true
                            }
                        
                    }
                    
                    
                   
                }
                .padding(.horizontal)
                .padding(.bottom, 25)
                
               
                
               
            }
        }
    }
}

#Preview {
    NotificationsView()
}
