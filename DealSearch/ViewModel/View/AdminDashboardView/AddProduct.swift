//
//  ProductCrud.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct AddProduct: View {
    @StateObject var productData = ProductData()
    @State private var addMessage = ""
    
    @State private var categoryId: Int = 0
    @State private var productDeal: Double = 0
    @State private var productImage: String = ""
    @State private var productName: String = ""
    @State private var productPrice: Double = 0
    @State private var shopId: Int = 0
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Scroll down to close")
                Image(systemName: "arrow.down")
            }
            Spacer().frame(width: 0, height: 80)
            
            VStack(spacing:20) {
                Group {
                    VStack(alignment: .leading) {
                        Text("Category ID:")
                        TextField("Category ID", value: $categoryId, format: .number)
                    }
                    VStack(alignment: .leading) {
                        Text("Product Name:")
                        TextField("Product Name", text: $productName)
                    }
                    VStack(alignment: .leading) {
                        Text("Product Image URL:")
                        TextField("Product Image URL", text: $productImage)
                    }
                    VStack(alignment: .leading) {
                        Text("Product deal (Price after sale):")
                        TextField("Product deal (Price after sale)", value: $productDeal, format: .number)
                    }
                    VStack(alignment: .leading) {
                        Text("Original Product Price:")
                        TextField("Original product price", value: $productPrice, format: .number)
                    }
                    VStack(alignment: .leading) {
                        Text("Shop ID:")
                        TextField("Shop ID", value: $shopId, format: .number)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    if checkField() {
                    productData.addData(
                        category_id: categoryId,
                        product_deal: productDeal,
                        product_image: productImage,
                        product_name: productName,
                        product_price: productPrice,
                        shop_id: shopId)
                    addMessage = "added"
                    
                    // Clear the text field after submit
                    categoryId = 0
                    productName = ""
                    productDeal = 0
                    productPrice = 0
                    shopId = 0
                    } else {
                        addMessage = "error"
                    }
                } label: {
                    Text("Add Product")
                }
                .padding(.bottom, 15)
            }
            .padding(.horizontal, 30)
            
            if addMessage == "added" {
                Text("Added!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
            } else {
                Text("Invalid input!")
                    .foregroundColor(.red)
                    .font(.system(size: 25))
            }
        }
        
    }
    
    func checkField() -> Bool{
        if categoryId == 0 || productName.isEmpty || shopId == 0 {
            return false
        }
        return true
    }
}

struct AddProduct_Previews: PreviewProvider {
    static var previews: some View {
        AddProduct()
    }
}
