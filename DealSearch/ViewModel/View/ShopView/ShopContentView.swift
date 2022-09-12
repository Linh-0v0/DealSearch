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
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    Text("Hello")
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
                
                // MARK: TRENDING SEARCH
                VStack (alignment: .center) {
                    Text("Trending search")
                        .font(.system(size: 28, weight: .bold, design: Font.Design.default))
                        .padding(.bottom,20)
                        .padding(.trailing, 30)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 10) {
                            ForEach(0..<3, id: \.self) { index in
                                Button(action: {
                                    print("Click")
                                }, label: {
                                    ZStack {
                                        Image("menshirt")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150)
                                            .cornerRadius(20)
                                            .background(Color.black)
                                            .opacity(0.8)
                                            .frame(width: 150, height: 150)
                                        VStack {
                                            Spacer()
                                            Text("Men shirt")
                                                .padding(.bottom, 10)
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(Color.white)
                                        }
                                    }
                                })
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
                                Button(action: {
                                    print("Clicked")
                                }, label: {
                                    VStack {
                                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                                            .fill(Color("Green"))
                                            .frame(width: 100, height: 100)
                                            
                                        Text("Category")
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
                                HStack(spacing: 20) {
                                    ForEach(0..<3, id: \.self) { index in
                                        VStack {
                                            Image("menshirt")
                                                .resizable()
                                                .cornerRadius(20)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 150)
                                            
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    Text("Title")
                                                        .font(.system(size: 20, weight: .bold))
                                                        .foregroundColor(.primary)
                                                    Text("$ PRICE".uppercased())
                                                        .font(.system(size: 16))
                                                        .foregroundColor(.secondary)
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
