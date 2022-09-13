//
//  ShopCompareView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ShopCompareView: View {
    var body: some View {
        Text("Shopee")
            .foregroundColor(Color.white)
            .padding()
            .background(
                Capsule()
                    .fill(Color.orange)
            )
    }
}

struct ShopCompareView_Previews: PreviewProvider {
    static var previews: some View {
        ShopCompareView()
    }
}
