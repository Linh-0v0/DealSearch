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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
