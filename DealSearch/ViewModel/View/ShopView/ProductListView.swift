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
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    Text("Popular search")
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
                
                // MARK: PRICE FILTER
                HStack {
                    Text("Ordered by:")
                        .foregroundColor(Color.gray)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            Text("Price: Low to High")
                                .padding(.all, 15)
                                .background(Color("Green"))
                                .cornerRadius(20)
                                .foregroundColor(Color.white)
                            Text("Price: High to Low")
                                .padding(.all, 15)
                                .background(Color("Green"))
                                .cornerRadius(20)
                                .foregroundColor(Color.white)
                        }
                        .padding(.trailing, 30)
                    }
                }
                
                // MARK: SHOP FILTER
                ZStack {
                    VStack(alignment: .center) {
                        Text("E-commerce store")
                            .font(.system(size: 20, weight: .bold))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: gridItemVLayout, spacing: 20) {
                                ForEach(0..<6, id: \.self) { index in
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                        Text("Store")
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
                                Button(action: {
                                    print("Clicked")
                                }, label: {
                                    VStack {
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Color("Green"))
                                            .frame(width: 100, height: 100)
                                            
                                        Text("Catalog")
                                            .foregroundColor(Color.black)
                                    }
                                    
                                    
                                })
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
                            VStack {
                                
                                ZStack {
                                    Image("menshirt")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 150)
                                }
                                .cornerRadius(20)
                                .clipped()
                                .aspectRatio(1, contentMode: .fit)
                                
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Title")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.primary)
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
                                    .layoutPriority(100)
                     
                                    Spacer()
                                }
                                .padding(.top, 10)
                            }
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.8)
           
                            )
                            .padding(.trailing, 30)
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
