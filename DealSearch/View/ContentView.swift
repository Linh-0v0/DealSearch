//
//  ContentView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 26/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var shopList = ShopData()
    @StateObject var prodDealSortedList = DealCalcSorted()
    @State private var username: String = ""
    var usersList: [String:[Any]] = Defaults.getUsersList()
    
    var body: some View {
        RegisterView()
//        VStack {
//            TextField("Enter your name", text: $username)
//            Button {
//                // Save to userDefault
//                Defaults.save(username, attrb1: "", attrb2: "")
//
//                // PRINT
//                print("CurrentUser: \(Defaults.getCurrentUserDetail())")
//                for data in usersList {
//                    var user = Defaults.getSpecifiedUserDetail(username: data.key)
//                    print(user)
//                }
//                //                print(prodDealSortedList.prodDealSorted)
//            } label: {Text("Submit")}
//
//            /* LINK DOES NOT RUN*/
//            //            AsyncImage(url: URL(string: "http://images.amazon.com/images/P/0195153448.01.MZZZZZZZ.jpg"))
//            /* LINK THAT RUN*/
//            //            AsyncImage(url: URL(string: "https://media.croma.com/image/upload/f_auto,q_auto,d_Croma%20Assets:no-product-image.jpg,h_260,w_260/v1606071472/Croma%20Assets/Computers%20Peripherals/Projectors/Images/9007736684574.png"))
//
////            AsyncImage(url: URL(string: "https://media.croma.com/image/upload/f_auto,q_auto,d_Croma%20Assets:no-product-image.jpg,h_260,w_260/v1606071472/Croma%20Assets/Computers%20Peripherals/Projectors/Images/9007736684574.png")) { image in
////                image
////                    .resizable()
////                    .aspectRatio(contentMode: .fit)
////            } placeholder: {
////                Image(systemName: "photo")
////                    .imageScale(.large)
////                    .foregroundColor(.gray)
////            }
////            .frame(width: 100, height: 100)
//
//            List {
//                ForEach(prodDealSortedList.prodDealSorted) { data in
//                    AsyncImage(url: URL(string: data.productImage))
//                    { image in
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                    } placeholder: {
//                        Image(systemName: "photo")
//                            .imageScale(.large)
//                            .foregroundColor(.gray)
//                    }
//                    .frame(width: 100, height: 100)
//                }
//            }
//            .listStyle(.plain)
//
//            List(shopList.shopList){ data in
//                VStack {
//                    Text(data.shopName)
//                }
//            }
//
//
//        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
