//
//  TrendingSearchView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct TrendingSearchView: View {
    var body: some View {
        Button(action: {
            print("Click")
        }, label: {
            ZStack {
                Image("menshirt")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150)
                    .cornerRadius(20)
                    .background(Color.black)
                    .opacity(0.8)
                    .frame(width: 150, height: 150)
                VStack {
                    Spacer()
                    Text("Men shirt")
                        .padding(.bottom, 10)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                }
            }
        })
    }
}

struct TrendingSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingSearchView()
    }
}
