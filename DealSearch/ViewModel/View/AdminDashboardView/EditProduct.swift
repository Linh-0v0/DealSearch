/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 12/09/2022
  Last modified: 15/09/2022
  Acknowledgement: None
*/

import SwiftUI

struct EditProduct: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var showingUpdateSheet = false
    @State private var showingAddProduct = false
    @StateObject var productData = ProductData()
    @State private var searchText = ""
    
    var body: some View {
        // MARK: PRODUCT LIST
        List {
            ForEach(searchResults) { prod in
                HStack(alignment: .top, spacing: 17) {
                    Text(prod.id)
                    Text(prod.product_name)
                    
                    Spacer()
                    
                    // Edit Product
                    Button {
                        showingUpdateSheet.toggle()
                        print("Click Edit")
                        viewRouter.currentPage = .editProduct
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .sheet(isPresented: $showingUpdateSheet) {
                        UpdateProdSheetView(productClicked: prod)
                    }
                }
                .padding(.vertical)
                
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    // Delete Product
                    Button(role: .destructive) {
                        productData.deleteData(productToDelete: prod)
                        print("Delete Item")
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("All Products")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Add Product") {
                    showingAddProduct.toggle()
                    print("Pressed")
                }
                .sheet(isPresented: $showingAddProduct) {
                    AddProduct()
                }
            }
        }
        
    }
    
    var searchResults: [Product] {
        if searchText.isEmpty {
            return productData.productList
        } else {
            return productData.productList.filter {$0.product_name.contains(searchText) || $0.id.contains(searchText)}
        }
    }
    
}

struct EditProduct_Previews: PreviewProvider {
    static var previews: some View {
        EditProduct(productData: ProductData())
    }
}

// MARK: UPDATE SHEET
struct UpdateProdSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var productData = TrendingProductData()
    @State var productClicked: Product
    @State private var updateMessage = ""
    
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
            
            // MARK: UPDATE FIELD INPUTS
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
                
                // MARK: BUTTON UPDATE
                Button {
                    if checkField() {
                        productData.updateData(
                            productToUpdate: productClicked,
                            category_id: categoryId,
                            product_deal: productDeal,
                            product_image: productImage ?? productClicked.product_image,
                            product_name: productName,
                            product_price: productPrice,
                            shop_id: shopId)
                        updateMessage = "updated"
                        
                        // Clear the text field after submit
                        categoryId = 0
                        productName = ""
                        productDeal = 0
                        productPrice = 0
                        shopId = 0
                    } else {
                        updateMessage = "error"
                    }
                } label: {
                    Text("Update Product")
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            if updateMessage == "updated" {
                Text("Updated!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
            } else if updateMessage == "error" {
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
