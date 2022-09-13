//
//  ProductCardView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("menshirt")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
            }
            .cornerRadius(20)
            .clipped()
            .aspectRatio(1, contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)
                    Text("$ PRICE".uppercased())
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .center) {
                        Button(action: {
                            print("Clicked")
                        }, label: {
                            Text("Store")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    })
                    }
                }
                .layoutPriority(100)
 
                Spacer()
            }
            .padding(.top, 10)
        }
        .padding()
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)

        )
        .padding(.trailing, 30)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView()
    }
}
