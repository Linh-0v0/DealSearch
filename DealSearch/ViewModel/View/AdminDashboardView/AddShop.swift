//
//  AddShop.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//


//var id: String
//var shop_logo: String
//var shop_name: String
import SwiftUI

struct AddShop: View {
    @StateObject private var shopData = ShopData()
    @State private var addMessage = ""
    
    @State private var shopLogo: String = ""
    @State private var shopName: String = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Scroll down to close")
                Image(systemName: "arrow.down")
            }
            Spacer().frame(width: 0, height: 80)
            
            // MARK: INPUT FIELDS
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
                
                Button {
                    if checkField() {
                        shopData.addData(shop_logo: shopLogo, shop_name: shopName)
                    addMessage = "added"
                    
                    // Clear the text field after submit
                    shopLogo = ""
                    shopName = ""
                    } else {
                        addMessage = "error"
                    }
                } label: {
                    Text("Add Shop")
                }
                .padding(.bottom, 15)
            }
            .padding(.horizontal, 30)
            
            if addMessage == "added" {
                Text("Added!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
            } else if addMessage == "error" {
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

struct AddShop_Previews: PreviewProvider {
    static var previews: some View {
        AddShop()
    }
}
