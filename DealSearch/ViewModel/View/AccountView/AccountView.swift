//
//  AccountView.swift
//  DealSearch
//
//  Created by Duc Ho on 12/09/2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                headerView
                
                actionButton
                
                profileDetail
                
                Spacer()
                
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

extension AccountView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 11, y: 12)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
}

extension AccountView {
    var actionButton: some View {
        HStack {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
    }
}

extension AccountView {
    var profileDetail: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Duc Ho Minh")
                    .font(.title2).bold()
                    
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
                    
            }
        }
    }
}
