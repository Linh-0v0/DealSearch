//
//  TestView.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 03/09/2022.
//

import SwiftUI

struct TestView: View {
    @StateObject var users = UserData()
    var body: some View {
        List(users.userList) { item in
            Text(item.phoneNumber)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
