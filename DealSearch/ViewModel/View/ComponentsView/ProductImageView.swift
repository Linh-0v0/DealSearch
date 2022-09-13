//
//  ProductImageView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ProductImageView: View {
    var body: some View {
        ZStack {
            Image("menshirt")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
        }
        .clipped()
        .aspectRatio(1, contentMode: .fit)
    }
}

struct ProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView()
    }
}
