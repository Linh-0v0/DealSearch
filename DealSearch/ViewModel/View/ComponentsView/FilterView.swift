//
//  FilterView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        HStack(spacing: 10) {
            Text("Price: Low to High")
                .padding(.all, 15)
                .background(Color("Green"))
                .cornerRadius(20)
                .foregroundColor(Color.white)
            Text("Price: High to Low")
                .padding(.all, 15)
                .background(Color("Green"))
                .cornerRadius(20)
                .foregroundColor(Color.white)
        }
        .padding(.trailing, 30)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
