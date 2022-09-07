//
//  DealSearchApp.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 26/08/2022.
//

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
