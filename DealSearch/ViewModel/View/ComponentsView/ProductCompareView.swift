//
//  ProductCompareView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ProductCompareView: View {
    var body: some View {
        HStack {
            HStack {
                ZStack {
                    Image("menshirt")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 80)
                }
                .clipped()
                .aspectRatio(1, contentMode: .fit)

                Text("Product name")
                    .font(.system(size: 16))
            }
            Spacer()
            HStack {
                Text("$ 400")

                Button(action: {
                    print("Clicked")
                }, label: {
                    Text("Go to store")
                        .padding(.horizontal, 10)
                        .padding(.vertical)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.orange)
                        )
                })
            }

        }
        .padding(.vertical, 10)
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .cornerRadius(10)
        
        Divider()
    }
}

struct ProductCompareView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCompareView()
    }
}
