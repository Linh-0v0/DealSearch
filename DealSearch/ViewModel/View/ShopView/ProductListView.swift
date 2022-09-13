//
//  ProductListView.swift
//  DealSearch
//
//  Created by Duc Ho on 11/09/2022.
//

import SwiftUI

struct ProductListView: View {
    
    private var gridItemVLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Men Shirt")
                    .foregroundColor(Color("Green"))
                    .font(Font.custom("Montserrat-Bold", size: 36)).foregroundColor(Color("Green"))
                    .padding(.top, 30)
                
                // MARK: POPULAR SEARCH
                VStack(alignment: .leading) {
                    Text("Popular search")
                        .foregroundColor(Color.gray)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 10) {
                            ForEach(0..<3, id: \.self) { index in
                                PopularSearchView()
                            }
                        }
                    }

                }
                
                // MARK: FILTER
                HStack {
                    Text("Ordered by:")
                        .foregroundColor(Color.gray)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        FilterView()
                    }
                }
                
                // MARK: ECOM STORES
                ZStack {
                    VStack(alignment: .center) {
                        Text("E-commerce store")
                            .font(.system(size: 20, weight: .bold))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: gridItemVLayout, spacing: 20) {
                                ForEach(0..<6, id: \.self) { index in
                                    EcomStoreView()
                                }
                            }
                        }
                        .frame(height: 130)
                    }
                }
                .frame(maxWidth: .infinity)
                
                .padding(.all)
                
                .background(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1))
                .cornerRadius(20)
                .padding(.trailing,30)
                
                // MARK: CATALOG
                VStack (alignment: .leading) {
                    Text("Catalog")
                        .foregroundColor(Color.gray)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: gridItemVLayout, spacing: 20) {
                            ForEach(0..<10, id: \.self) { index in
                                CategoryView()
                            }
                        }
                        .frame(height: 280)
                    }
                    .padding(.trailing, 30)
                }
                
                // MARK: PRODUCT LIST
                VStack(alignment: .leading) {
                    Text("RECOMMEND FOR YOU")
                        .font(.system(size: 20, weight: .bold))
                    LazyVGrid(columns: gridItemVLayout, spacing: 20) {
                        ForEach(0..<20, id: \.self) { index in
                            ProductCardView()
                        }
                    }
                }
                
            }
            .padding(.leading, 30)
            }

    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
