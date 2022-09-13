//
//  EditShop.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct EditShop: View {
    @State private var showingUpdateSheet = false
    @State private var showingAddShop = false
    @StateObject var shopData = ShopData()
    @State private var searchText = ""
    
    var body: some View {
        // MARK: SHOP LIST
        List {
            ForEach(searchResults) { shop in
                HStack(alignment: .top, spacing: 17) {
                    Text(shop.id)
                    Text(shop.shop_name)
                    
                    Spacer()
                }
                
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    // Delete Shop
                    Button(role: .destructive) {
                        shopData.deleteData(shopToDelete: shop)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    
                    // Edit Product
                    Button {
                        showingUpdateSheet.toggle()
                    } label: {
                        Label("Pencil", systemImage: "pencil")
                    }
                    .sheet(isPresented: $showingUpdateSheet) {
                        UpdateShopSheetView(shopClicked: shop)
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("All Shops")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Add Shop") {
                    showingAddShop.toggle()
                    print("Pressed")
                }
                .sheet(isPresented: $showingAddShop) {
                    AddShop()
                }
            }
        }
        
    }
    
    var searchResults: [Shop] {
        if searchText.isEmpty {
            return shopData.shopList
        } else {
            return shopData.shopList.filter {$0.shop_name.contains(searchText) || $0.id.contains(searchText)}
        }
    }
}

struct EditShop_Previews: PreviewProvider {
    static var previews: some View {
        EditShop()
    }
}

// MARK: UPDATE SHEET
struct UpdateShopSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var shopData = ShopData()
    @State var shopClicked: Shop
    @State private var updateMessage = ""
    
    @State private var shopName: String = ""
    @State private var shopLogo: String = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Scroll down to close")
                Image(systemName: "arrow.down")
            }
            Spacer().frame(width: 0, height: 80)
            
            // MARK: SHOP INPUT FIELDS
            VStack(spacing:20) {
                Group {
                    VStack(alignment: .leading) {
                        Text("Shop Name:")
                        TextField("Shop Name", text: $shopName)
                    }
                    VStack(alignment: .leading) {
                        Text("Shop Logo URL:")
                        TextField("Shop Logo URL", text: $shopLogo)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // MARK: BUTTON UPDATE
                Button {
                    if checkField() {
                        shopData.updateData(shopToUpdate: shopClicked, shop_name: shopName, shop_logo: shopLogo ?? shopClicked.shop_logo)
                        updateMessage = "updated"
                        
                        // Clear the text field after submit
                        shopName = ""
                        shopLogo = ""
                        
                    } else {
                        updateMessage = "error"
                    }
                } label: {
                    Text("Update Shop")
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
        if shopName == "" {
            return false
        }
        return true
    }
}


