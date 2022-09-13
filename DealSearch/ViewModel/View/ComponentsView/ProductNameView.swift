//
//  ProductNameView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ProductNameView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Product name")
                .font(.system(size: 26, weight: .bold))
            
            Button(action: {
                print("Clicked")
            }, label: {
                Text("Notification the deal")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            })
        }
        .padding(.bottom, 20)
    }
}

struct ProductNameView_Previews: PreviewProvider {
    static var previews: some View {
        ProductNameView()
    }
}
