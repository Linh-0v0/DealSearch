//
//  ProductDetailVie.swift
//  DealSearch
//
//  Created by Duc Ho on 11/09/2022.
//

import SwiftUI

struct ProductDetailVie: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: PRODUCT IMAGE
                ProductImageView()
                
                // MARK: PRODUCT DETAIL
                VStack(alignment: .leading) {
                    ProductNameView()
                    
                    ProductPriceView()
                    
                    // MARK: REVIEW SESSION
                    ProductReviewView()
                    
                    // MARK: PRICE COMPARE
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Deal compare")
                                .font(.system(size: 22, weight: .bold))

                            Text("We found 12 other places, the deals are from $ 200 - $ 1000")
                                .foregroundColor(Color.gray)
                        }

                        ForEach(0..<2, id: \.self) { index in
                            ShopCompareView()
                            ForEach(0..<3, id: \.self) { index in
                                ProductCompareView()
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    
                    // MARK: PRODUCT DESCRIPTION
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the product")
                            .font(.system(size: 22, weight: .bold))
                        
                        Text("Product description")
                            .font(.system(size: 16))
                            .foregroundColor(Color.gray)
                    }
                    .padding(.bottom, 10)
                    
                    // MARK: USER COMMENT
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reviews from buyer")
                            .font(.system(size: 22, weight: .bold))
                        
                        VStack(alignment: .leading, spacing: 30) {
                            ForEach(0..<3, id: \.self) { index in
                                CommentView()
                            }
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.trailing, 30)
                .padding(.leading, 30)
                
            }
        }
    }
}

struct ProductDetailVie_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailVie()
    }
}
