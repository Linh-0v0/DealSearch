/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 13/09/2022
  Last modified: 17/09/2022
  Acknowledgement: None
*/

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            headerNotiView
            
            ScrollView {
                dailyNotiView
                dailyNotiView
                dailyNotiView
                dailyNotiView
                dailyNotiView
            }
            
        }
        
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

// MARK: DAILY NOTIFICATION
extension NotificationView {
    var dailyNotiView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("TODAY")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Mark as read")
                        .font(.subheadline)
                        .foregroundColor(Color("Green"))
                })
            }
            .padding()
            
            ZStack(alignment: .center) {
                Color(.systemGray6)
                
                HStack(spacing: 15){
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color("Green"))
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("October promotion 50%")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("Get 50% cashback for the next top up")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("Top up now")
                                    .font(.caption)
                                    .foregroundColor(Color("Green"))
                                
                                Image("chevron.left")
                                    .resizable()
                                    .frame(width: 7, height: 13)
                                Spacer()
                            }
                            
                        })
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)

            }
            .frame(width: .infinity, height: 100)
            .cornerRadius(20)
            .padding(.horizontal)
            
            Spacer()
        }
        
    }
}

// MARK: HEADER NOTIFICATION
extension NotificationView {
    var headerNotiView: some View {
        ZStack(alignment: .top) {
            Color("Green")
                .ignoresSafeArea()
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 7, height: 13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color(.white), lineWidth: 0.8)
                                .frame(width: 40, height: 40)
                        )
                        .foregroundColor(.white)
                        .offset(x: 11, y: 12)
                }
                
                Spacer()
                
                Text("Notification view")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top,20)
                    .font(.title3)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color(.white), lineWidth: 0.8)
                                .frame(width: 40, height: 40)
                        )
                        .foregroundColor(.white)
                        .offset(x: -2, y: 12)
                        
                }
                    
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 80)
    }
}

