//
//  PopularSearchView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct PopularSearchView: View {
    var body: some View {
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

struct PopularSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PopularSearchView()
    }
}
