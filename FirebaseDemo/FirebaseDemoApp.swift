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
    
    // MARK: Initialize the DB and call methods on it
    init() {
        FirebaseApp.configure()
        
        makeReservation()
        challengeData()
    }
    
    func makeReservation() {
        
        // MARK: Reference the DB and adding new data to it
        // Reference to the cloud firestore database
        let db = Firestore.firestore()
        
        // Reference to Reservations collection
            // Will be created if it does not already exist
        let reservations =
            db.collection("reservations")
        
        // Create a document with a given identifier
        reservations.document("test123")
            .setData(["name":"Carol", "people": 22])
        
        // Create a document with a unique identifier
        reservations.document().setData(["name": "Tom"])
        
        // Create a document with given data
        let document = reservations.addDocument(data: ["name": "Sue", "people": 10])
        
        // Work with the document
        print(document)
        
        
        // MARK: Changing data in the database
        //Add info or change a database collection
        let reservation = db.collection("reservations").document("test123")

        // OVERWRITE the data using the detData method
//        reservation.setData(["name":"Carol", "people": 24])
        
        // MERGE the data using the setData method
//        reservation.setData(["people": 24], merge: true)
        
        // Update the data in the document without overwriting using the updateData method
        reservation.updateData(["people": 24])
        

        
    }
    
    // MARK: Challenge methods and data
    func challengeData() {
        
        let db = Firestore.firestore()
        
        let games = db.collection("games")
        
        let consoles = db.collection("consoles")
        
        games.document()
            .setData(["name":"Super Mario World", "platform":"Super Nintendo", "genre":"Platformer"])
        
        games.document("Tetris")
            .setData(["name":"Tetris", "platform":"Nintendo", "genre":"Puzzle"])
        
        consoles.document("snes")
            .setData(["name":"Super Nintendo Entertainment System", "company":"Nintendo"])
        
        consoles.document("nes")
            .setData(["name":"Nintendo Entertainment System", "company":"Nintendo"])
        
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
