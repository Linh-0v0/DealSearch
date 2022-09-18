/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 07/09/2022
  Last modified: 08/09/2022
  Acknowledgement: None
*/

import SwiftUI

struct LandingNavigation: View {
    var body: some View {
        // Check Login state in UserDefault
        // to navigate to specific view
        if !Defaults.getCurrentUserDetail().email.isEmpty {
            MainTabView()
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
