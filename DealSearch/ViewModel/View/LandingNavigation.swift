//
//  LandingNavigation.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 07/09/2022.
//

import SwiftUI

struct LandingNavigation: View {
    var body: some View {
        if !Defaults.getCurrentUserDetail().email.isEmpty {
            TestView()
        } else {
            WelcomeView()
        }
    }
}

struct LandingNavigation_Previews: PreviewProvider {
    static var previews: some View {
        LandingNavigation()
    }
}
