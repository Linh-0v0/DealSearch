//
//  ShopContentView.swift
//  DealSearch
//
//  Created by Duc Ho on 11/09/2022.
//

import SwiftUI

struct ShopContentView: View {
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: POPULAR SEARCH
                VStack(alignment: .leading) {
                    Text("Popular search")
                        .font(.system(size: 24, weight: .bold, design: Font.Design.default))
                        .padding(.bottom, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 10) {
                            ForEach(0..<3, id: \.self) { index in
                                 PopularSearchView()
                            }
                        }
                    }

                }
                .padding(.top, 20)
                
                // MARK: TRENDING SEARCH
                VStack (alignment: .center) {
                    Text("Trending search")
                        .font(.system(size: 28, weight: .bold, design: Font.Design.default))
                        .padding(.bottom,20)
                        .padding(.trailing, 30)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 10) {
                            ForEach(0..<3, id: \.self) { index in
                                TrendingSearchView()
                            }
                            .cornerRadius(20)
                        }
                    }
                }
                
                // MARK: CATEGORY
                VStack (alignment: .leading) {
                    Text("Category")
                        .font(.system(size: 24, weight: .bold))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridItemLayout, spacing: 20) {
                            ForEach(0..<10, id: \.self) { index in
                                CategoryView()
                            }
                        }
                        .frame(height: 280)
                    }
                    .padding(.trailing, 30)
                }
                
                // MARK: PRODUCT LIST
                VStack (alignment: .leading, spacing: 30) {
                    ForEach(0..<3, id: \.self) {index in
                        VStack(alignment:.leading, spacing: 20){
                            HStack {
                                Text("Product list")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Spacer()
                                Button(action: {
                                    print("Clicked")
                                }, label: {
                                    Text("View all")
                                        .foregroundColor(Color.gray)
                                })
                                
                            }
                            .padding(.trailing, 30)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    ForEach(0..<3, id: \.self) { index in
                                        ProductCardView()
                                    }
                                }
                                .padding(.trailing, 30)
                                
                            }
                        }
                        
                    }
                    
                }
            }
            
        }
        .padding(.leading, 30)
    }
}

struct ShopContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopContentView()
    }
}
