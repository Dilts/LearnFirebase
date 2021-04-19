//
//  FirebaseDemoApp.swift
//  FirebaseDemo
//
//  Created by Brian Dilts on 4/19/21.
//

import SwiftUI
import Firebase

@main
struct FirebaseDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
