//
//  CategoryView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        Button(action: {
            print("Clicked")
        }, label: {
            VStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color("Green"))
                    .frame(width: 100, height: 100)
                    
                Text("Catalog")
                    .foregroundColor(Color.black)
            }
            
            
        })
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
