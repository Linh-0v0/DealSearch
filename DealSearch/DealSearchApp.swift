/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 26/08/2022
  Last modified: 12/09/2022
  Acknowledgement: None
*/

import SwiftUI
import Firebase

@main
struct DealSearchApp: App {
    
    @StateObject var viewRouter = ViewRouter()

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MotherView().environmentObject(viewRouter)
        }
    }
}
