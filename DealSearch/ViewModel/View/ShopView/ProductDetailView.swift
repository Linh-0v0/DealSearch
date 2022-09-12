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
            // MARK: PRODUCT DETAIL
            VStack(alignment: .leading) {
//                Image("menshirt")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
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
                    
                    // MARK: REVIEW SESSION
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
                    
                    // MARK: PRICE COMPARE
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Deal compare")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color.black)
                            
                            Text("We found 12 other places, the deals are from $ 200 - $ 1000")
                                .foregroundColor(Color.gray)
                        }
                        
                        ForEach(0..<3, id: \.self) { index in
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
                                        Image("menshirt")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Text("Product name")
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
                                .padding(.horizontal, 10)
                                .padding(.vertical, 10)
                                .frame(width: 400, height: 100)
                                .cornerRadius(10)
                            }
                        }
                        .padding(.bottom, 10)
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
