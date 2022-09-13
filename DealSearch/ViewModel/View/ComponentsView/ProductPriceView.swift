//
//  ProductPriceView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ProductPriceView: View {
    var body: some View {
        HStack {
            Text("Price from store")
                .foregroundColor(Color.gray)
            
            Text("Shopee")
                .padding()
                .foregroundColor(Color.white)
                .background(
                    Capsule()
                        .fill(Color.orange)
                )
        }
        .padding(.bottom, 20)
        
        // MARK: PRICE SESSION
        HStack {
            VStack(alignment: .leading,spacing: 3) {
                Text("$ 500.00")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.red)
                
                Text("no longer $ 600.00")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            Button(action: {
                print("Clicked")
            }, label: {
                Text("Go to store")
                    .padding(.horizontal, 40)
                    .padding(.vertical)
                    .foregroundColor(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.orange)
                    )
            })
        }
    }
}

struct ProductPriceView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPriceView()
    }
}
