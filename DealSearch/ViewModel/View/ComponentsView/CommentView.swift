//
//  CommentView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 20) {
                Rectangle()
                    .fill(.gray)
                    .opacity(0.2)
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 15) {
                        Text("User name")
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Bought on Shopee")
                                .fontWeight(.medium)
                                .foregroundColor(Color.orange)
                                .font(.system(size: 16))
                        }
                    }
                    
                    Text("4.3 review stars")
                        .foregroundColor(Color.yellow)
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Good product")
                
                ZStack {
                    Image("menshirt")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 100, height:100)
                .clipped()
                .aspectRatio(1, contentMode: .fit)
                
                Text("1 year ago")
                    .font(.system(size: 16))
                    .foregroundColor(Color.gray)
            }
            
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
