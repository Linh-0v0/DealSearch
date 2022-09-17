//
//  ProductListView.swift
//  DealSearch
//
//  Created by Duc Ho on 11/09/2022.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var currentProdByShop: CurrentProdByShop
    @StateObject var productData = ProductData()
    @StateObject var shopData = ShopData()
    @StateObject var popularSearchData = PopularSearchData()
    @StateObject var dealCalcSorted = DealCalcSorted()
    
    @State var shopClickedId: Int = 0
    @State var fetchedSearchkey: [PopularSearch] = []
    @State var fetchedProduct: [Product] = []
    @State var sortedFetchedProduct: [Product] = []
    
    
    var gridItemVLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
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
                    popularSearch
                }
                
                // MARK: FILTER
                HStack {
                    Text("Ordered by:")
                        .foregroundColor(Color.gray)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        filterView
                    }
                }
                
                // MARK: ECOM STORES
                ZStack {
                    VStack(alignment: .center) {
                        Text("E-commerce store")
                            .font(.system(size: 20, weight: .bold))
                        ecomStoreView
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.all)
                .background(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1))
                .cornerRadius(20)
                .padding(.trailing,30)
                
                // MARK: PRODUCT LIST
                VStack(alignment: .leading) {
                    Text("RECOMMEND FOR YOU")
                        .font(.system(size: 20, weight: .bold))
                    productCardView
                }
                
            }
            .padding(.leading, 30)
        }
        
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(currentProdByShop: CurrentProdByShop(shopClickedId: 1), shopClickedId: 1)
    }
}

extension ProductListView {
    var popularSearch: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 10) {
                ForEach(popularSearchData.popularSearchList) { item in
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text(item.product_name)
                            .fontWeight(.bold)
                            .frame(width: 170, height: 30)
                    }
                    .padding()
                    .background(
                        Capsule()
                            .strokeBorder(Color.black, lineWidth: 0.8)
                            .clipped()
                            .frame(width: 230, height: 50)
                    )
                    .clipShape(Capsule())
                }
            }
        }
    }
}

extension ProductListView {
    var filterView: some View {
        HStack(spacing: 10) {
            Button {
                // Get Product By Shop
                currentProdByShop.getData(shopClickedId: shopClickedId)
                sortedFetchedProduct = currentProdByShop.currentProduct
                
                //Sort Product low -> high
                dealCalcSorted.productDealSorted(productList: sortedFetchedProduct, lowToHigh: true)
            } label: {
                Text("Price: Low to High")
                    .padding(.all, 15)
                    .background(Color("Green"))
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
            }
            
            Button {
                // Get Product By Shop
                currentProdByShop.getData(shopClickedId: shopClickedId)
                sortedFetchedProduct = currentProdByShop.currentProduct
                
                //Sort Product high -> low
                dealCalcSorted.productDealSorted(productList: sortedFetchedProduct, lowToHigh: false)
            } label: {
                Text("Price: High to Low")
                    .padding(.all, 15)
                    .background(Color("Green"))
                    .cornerRadius(20)
                    .foregroundColor(Color.white)
            }
        }
        .padding(.trailing, 30)
    }
}

extension ProductListView {
    var ecomStoreView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridItemVLayout, spacing: 20) {
                ForEach(shopData.shopList) { shop in
                    Button  {
                        shopClickedId = Int(shop.id) ?? 1
                        // Get Product By Shop
                        currentProdByShop.getData(shopClickedId: shopClickedId)
                        fetchedProduct = currentProdByShop.currentProduct
                    } label: {
                        Image(systemName: "magnifyingglass").foregroundColor(Color("Black"))
                        Text(shop.shop_name)
                            .font(Font.custom("Montserrat-Regular", size: 15)).foregroundColor(Color("Black"))
                        
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
        .frame(height: 130)
    }
}

extension ProductListView {
    var productCardView: some View {
        
        LazyVGrid(columns: gridItemVLayout, spacing: 20) {
            if shopClickedId == 0 {
                ForEach(productData.productList) { prod in
                    VStack {
                        VStack {
                            AsyncImage(url: URL(string: prod.product_image)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 130, height: 150)
                                        .cornerRadius(20)
                                        .background(Color.black)
                                        .opacity(0.8)
                                        .frame(width: 150, height: 150)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                        .imageScale(.large)
                                        .foregroundColor(.gray)
                                        .frame(width: 130, height: 150)
                                        .border(Color.gray, width: 1)
                                    
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            
                            
                            VStack(alignment: .leading) {
                                Text(prod.product_name)
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.primary)
                                    .frame(width: 130, height: 80)
                                
                                Text(String(prod.product_price))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                                Text(String(prod.product_deal))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                            }
                            .layoutPriority(100)
                            Spacer()
                            
                        }
                    }
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)
                        
                    )}
                
            } else if shopClickedId != 0 {
                ForEach(currentProdByShop.currentProduct) { prod in
                    VStack {
                        VStack {
                            AsyncImage(url: URL(string: prod.product_image)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 130, height: 150)
                                        .cornerRadius(20)
                                        .background(Color.black)
                                        .opacity(0.8)
                                        .frame(width: 150, height: 150)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                        .imageScale(.large)
                                        .foregroundColor(.gray)
                                        .frame(width: 130, height: 150)
                                        .border(Color.gray, width: 1)
                                    
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            
                            
                            VStack(alignment: .leading) {
                                Text(prod.product_name)
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.primary)
                                    .frame(width: 130, height: 80)
                                
                                Text(String(prod.product_price))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                                Text(String(prod.product_deal))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                            }
                            .layoutPriority(100)
                            Spacer()
                            
                        }
                    }
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)
                        
                    )}
                
            } else if (shopClickedId != 0 && !dealCalcSorted.prodDealSorted.isEmpty) {
                ForEach(dealCalcSorted.prodDealSorted) { prod in
                    VStack {
                        VStack {
                            AsyncImage(url: URL(string: prod.product_image)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                        .frame(width: 130, height: 150)
                                        .cornerRadius(20)
                                        .background(Color.black)
                                        .opacity(0.8)
                                        .frame(width: 150, height: 150)
                                } else if phase.error != nil {
                                    Image(systemName: "photo")
                                        .imageScale(.large)
                                        .foregroundColor(.gray)
                                        .frame(width: 130, height: 150)
                                        .border(Color.gray, width: 1)
                                    
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            
                            
                            VStack(alignment: .leading) {
                                Text(prod.product_name)
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(.primary)
                                    .frame(width: 130, height: 80)
                                
                                Text(String(prod.product_price))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                                Text(String(prod.product_deal))
                                    .font(.system(size: 16))
                                    .foregroundColor(.secondary)
                            }
                            .layoutPriority(100)
                            Spacer()
                            
                        }
                    }
                    .padding()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)
                        
                    )}
            }
            
        }
        
    }
}
