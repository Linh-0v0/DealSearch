/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 01/09/2022
  Last modified: 18/09/2022
  Acknowledgement: None
*/

import SwiftUI

struct registerFieldTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-SemiBold", size: 15)).foregroundColor(Color("Black"))
            .padding(.bottom, 0)
    }
}

struct registerInputField: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-Regular", size: 14))
            .textInputAutocapitalization(.never)
            .autocapitalization(.none)
            .disableAutocorrection(true)
    }
}

struct registerPaddingBtwField: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 15)
    }
}

struct accountProfileTitle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-SemiBold", size: 16)).foregroundColor(Color("Black"))
            .padding(.bottom, 0)
    }
}


struct accountProfileField: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Montserrat-Regular", size: 15)).foregroundColor(Color("Black"))
            .padding(.bottom, 0)
    }
}

struct accountProfilePaddingBtwField: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.bottom, 15)
    }
}
