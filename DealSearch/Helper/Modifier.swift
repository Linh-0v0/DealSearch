//
//  Modifier.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct registerFieldTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-SemiBold", size: 16)).foregroundColor(Color("Black"))
            .padding(.bottom, 0)
    }
}

struct registerInputField: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-Regular", size: 15))
            .textInputAutocapitalization(.never)
    }
}

struct registerPaddingBtwField: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 15)
    }
}
