//
//  ProductDetailVie.swift
//  DealSearch
//
//  Created by Duc Ho on 11/09/2022.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: PRODUCT IMAGE
                productImageView
                
                // MARK: PRODUCT DETAIL
                VStack(alignment: .leading) {
                    productNameView
                    
                    productPriceView
                    
                    // MARK: REVIEW SESSION
                    productReviewView
                    
                    // MARK: PRICE COMPARE
                    priceCompareView
                    
                    // MARK: PRODUCT DESCRIPTION
                    productDescriptionView
                    
                    // MARK: USER COMMENT
                    userCommentView
                }
                .padding(.top, 20)
                .padding(.trailing, 30)
                .padding(.leading, 30)
                
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}

extension ProductDetailView {
    var productImageView: some View {
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

extension ProductDetailView {
    var productNameView: some View {
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

extension ProductDetailView {
    var productPriceView: some View {
        VStack {
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
}

extension ProductDetailView {
    var productReviewView: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text("4.3 review stars")
                .foregroundColor(Color.yellow)
            
            HStack {
                Spacer()
                Text("6 reviews")
                
                Text("128 sale values")
            }
            .foregroundColor(Color.gray)
        }
        .padding(.top,10)
        .padding(.bottom, 20)
        .frame(maxWidth:.infinity)

    }
}

extension ProductDetailView {
    var priceCompareView: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Deal compare")
                    .font(.system(size: 22, weight: .bold))

                Text("We found 12 other places, the deals are from $ 200 - $ 1000")
                    .foregroundColor(Color.gray)
            }

            ForEach(0..<2, id: \.self) { index in
                Text("Shopee")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(
                        Capsule()
                            .fill(Color.orange)
                    )
                ForEach(0..<3, id: \.self) { index in
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
            .padding(.bottom, 10)
        }
    }
}

extension ProductDetailView {
    var productDescriptionView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("About the product")
                .font(.system(size: 22, weight: .bold))
            
            Text("Product description")
                .font(.system(size: 16))
                .foregroundColor(Color.gray)
        }
        .padding(.bottom, 10)
    }
}

extension ProductDetailView {
    var userCommentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Reviews from buyer")
                .font(.system(size: 22, weight: .bold))
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(0..<3, id: \.self) { index in
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
                    Divider()
                }
            }
        }
    }
}
