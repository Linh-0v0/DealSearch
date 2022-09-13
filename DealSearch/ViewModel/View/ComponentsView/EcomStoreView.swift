//
//  EcomStoreView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct EcomStoreView: View {
    var body: some View {
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

struct EcomStoreView_Previews: PreviewProvider {
    static var previews: some View {
        EcomStoreView()
    }
}