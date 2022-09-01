//
//  ButtonAnimation.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 01/09/2022.
//

import SwiftUI

struct ButtonAnimation: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 190, height: 35)
            .background(Color("Dark-green"))
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(Font.custom("Inter-SemiBold", size: 16))
    }
}

struct ButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me") {
            print("Button clicked")
        }
        .buttonStyle(ButtonAnimation())
    }
}
