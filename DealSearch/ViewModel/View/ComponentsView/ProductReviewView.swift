//
//  ProductReviewView.swift
//  DealSearch
//
//  Created by Duc Ho on 13/09/2022.
//

import SwiftUI

struct ProductReviewView: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text("4.3 review stars")
                .foregroundColor(Color.yellow)
            
            HStack {
                Spacer()
                Text("6 reviews")
                
                Text("128 sale values")
            }
            .foregroundColor(Color.gray)
        }
        .padding(.top,10)
        .padding(.bottom, 20)
        .frame(maxWidth:.infinity)
    }
}

struct ProductReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ProductReviewView()
    }
}
