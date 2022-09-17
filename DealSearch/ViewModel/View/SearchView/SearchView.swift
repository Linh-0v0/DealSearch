//
//  SearchView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @StateObject var productData = ProductData()
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(productData.productList) { product in
                        HStack(spacing: 20) {
                            Rectangle()
                                .fill(Color(.systemGray6))
                                .frame(width: 80, height: 80)
                                .cornerRadius(20)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(product.product_name)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .frame(width: .infinity, height: 50)
                                
                                Text(String(product.product_deal_1))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                        }
                        .padding(.vertical,5)
                        .padding(.leading, 20)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
