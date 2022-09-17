//
//  SearchBarView.swift
//  DealSearch
//
//  Created by Duc Ho on 17/09/2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxHeight: .infinity, alignment: .leading)
                            .padding(.leading,8)
                        Spacer()
                    }
                    
                )
        }
        .padding(.horizontal, 4)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
