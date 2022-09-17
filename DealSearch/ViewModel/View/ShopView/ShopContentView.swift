//
//  ShopContentView.swift
//  DealSearch
//
//  Created by Duc Ho on 11/09/2022.
//

import SwiftUI

struct ShopContentView: View {
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @StateObject var currentProduct: CurrentProductData
    @StateObject var currentCateg: CurrentSearchData
    @StateObject private var categoryData = CategoryData()
    @StateObject private var trendingData = TrendingProductData()
    
    @State var isFetching = true
    @State var fetchedSearchkey: [PopularSearch] = []
    @State var fetchedProduct: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: POPULAR SEARCH
                VStack(alignment: .leading) {
                    Text("Popular search")
                        .font(.system(size: 24, weight: .bold, design: Font.Design.default))
                        .padding(.bottom, 20)
                    
                    popularSearch
                    
                }
                .padding(.top, 20)
                
                // MARK: TRENDING PRODUCT SEARCH
                VStack (alignment: .center) {
                    Text("Trending search")
                        .font(.system(size: 28, weight: .bold, design: Font.Design.default))
                        .padding(.bottom,20)
                        .padding(.trailing, 30)
                    trendingSearchView
                }
                
                // MARK: CATEGORY
                categoryView
                
                // MARK: PRODUCT LIST
                VStack (alignment: .leading, spacing: 30) {
                    HStack {
                        Text("Product list")
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        NavigationLink(destination: ProductListView(currentProdByShop: CurrentProdByShop(shopClickedId: 0))) {
                            Text("View All")
                        }
                        
                    }
                    
                    productRowList
                }
            }
            
        }
        .padding(.leading, 30)
    }
}

struct ShopContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopContentView(currentProduct: CurrentProductData(categoryClickedId: 1), currentCateg: CurrentSearchData(categoryClickedId: 1))
    }
}

extension ShopContentView {
    var trendingSearchView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(trendingData.trendingProductList) { trendProd in
                    Button(action: {
                        print("Clicked")
                    }, label: {
                        VStack {
                            
                            AsyncImage(url: URL(string: trendProd.product_image)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .opacity(0.8)
                                        .frame(width: 150, height: 150)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                       .imageScale(.large)
                                       .foregroundColor(.gray)
                                        .frame(width: 150, height: 150)
                                    
                                } else {
                                    ProgressView()
                                        .frame(width: 150, height: 150)
                                }
                            }
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)

                            )
                            
                            
                            Text(trendProd.product_name)
                                .padding(.top, 10)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color.black)
                                .frame(width: 150, height: 30)
                        }
                    })
                }
            }
        }
    }
}

extension ShopContentView {
    var categoryView: some View {
        VStack (alignment: .leading) {
            Text("Category")
                .font(.system(size: 24, weight: .bold))
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItemLayout, spacing: 20) {
                    ForEach(categoryData.categoryList) { cate in
                        Button(action: {
                            currentCateg.getData(categoryClickedId: Int(cate.id)!)
                            fetchedSearchkey = currentCateg.currentSearch
                            
                            currentProduct.getData(categoryClickedId: Int(cate.id)!)
                            fetchedProduct = currentProduct.currentProduct
                            
                            print("CURRENT SEARCH AFTER CLICKED: \(fetchedSearchkey)")
                        }, label: {
                            VStack {
                                AsyncImage(url: URL(string: cate.category_image)) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                    } else if phase.error != nil {
                                        Image(systemName: "photo")
                                                       .imageScale(.large)
                                                       .foregroundColor(.gray)
                                            .frame(width: 100, height: 100)
                                            .border(Color.gray, width: 1)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                
                                Text(cate.category_name)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                        })
                    }
                }
                .frame(height: 280)
            }
            .padding(.trailing, 30)
        }
    }
}

extension ShopContentView {
    var productRowList: some View {
        ScrollView(.horizontal) {
            HStack {
                if !fetchedProduct.isEmpty {
                    ForEach(fetchedProduct) { product in
                        VStack {
                            AsyncImage(url: URL(string: product.product_image)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                                   .imageScale(.large)
                                                   .foregroundColor(.gray)
                                        .frame(width: 100, height: 100)
                                        .border(Color.gray, width: 1)
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(product.product_name)
                                        .fontWeight(.bold)
                                        .frame(height: 20)
                                        .font(.subheadline)
                                        .foregroundColor(.primary)
                                        .truncationMode(.tail)
                                        
                                    
                                    Text("$ PRICE".uppercased())
                                        .font(.system(size: 16))
                                        .foregroundColor(.secondary)
                                    
                                    VStack(alignment: .center) {
                                        Button(action: {
                                            print("Clicked")
                                        }, label: {
                                            Text("Store")
                                                .frame(maxWidth: .infinity)
                                                .padding()
                                                .foregroundColor(Color.white)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                                        })
                                    }
                                }
                                .frame(width: 150)
                            }
                            .padding(.top, 10)
                        }
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)
                            
                        )
                        .padding(.trailing, 10)
                    }
                }
                
            }
            .padding(.trailing, 20)
            
        }
    }
}

extension ShopContentView {
    var popularSearch: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 10) {
                if !fetchedSearchkey.isEmpty {
                    ForEach(fetchedSearchkey) { search in
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text(search.product_name)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(
                            Capsule()
                                .strokeBorder(Color.black, lineWidth: 0.8)
                                .clipped()
                        )
                        .clipShape(Capsule())
                    }
                }
                
            }
        }
    }
}
