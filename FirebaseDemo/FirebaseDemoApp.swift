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
        
        
/*
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
*/

        // MARK: Delete from db
/*
        // Delete a field from a document
        let reservation = db.collection("reservations").document("test123") // Re-added for deletion
        reservation.updateData(["people": FieldValue.delete()])
        
        // Delete a document from a collection
        reservation.delete()

        
        //MARK: Error handling
        let doc = reservations.addDocument(data: [:]) { error in
            
            // Check if there was an error
            if let error = error {
                
                // If there is an error, log and retrun
                print(error.localizedDescription) // Do any other error handling...
                
            } else {
                
                return // Call Succeded
                
            }
            
        }
        
        doc.delete { (error) in
            // handle errors
        }
*/
         //MARK: Retrieving data from the DB
        
        // Get document reference
        let document = reservations.document("test123")
        
        // Get the ducument's information from the DB
        document.getDocument { (docSnapshot, error) in
            
            // Check for an error and handle it
            if let error = error {
                // handle error appropriately
                print(error.localizedDescription)
            } else if let docSnapshot = docSnapshot {
                
                print(docSnapshot.data())
                print(docSnapshot.documentID)
                
            } else {
                // no data was returned, hand it appropriately
            }
            
        }
        
        // Get all documents form a collection
        reservations.getDocuments { (querySnapshot, error) in
            
            // Check for an error
            if let error = error {
                
                // handle error
                print(error.localizedDescription)
                
            } else if let querySnapshot = querySnapshot {
                
                // handle the data
                for doc in querySnapshot.documents{
                    print(doc.documentID)
                }
                
            } else{
                
                print("No data was returned")
                
            }
            
            
        }
         
        
    } // End of makeReservation method
    
    // MARK: Challenge methods and data
    func challengeData() {
        
        let db = Firestore.firestore()
        
        let games = db.collection("games")
        
        let consoles = db.collection("consoles")
        
/*
        games.document()
            .setData(["name":"Super Mario World", "platform":"Super Nintendo", "genre":"Platformer"])
        
        games.document("Tetris")
            .setData(["name":"Tetris", "platform":"Nintendo", "genre":"Puzzle"])
        
        consoles.document("snes")
            .setData(["name":"Super Nintendo Entertainment System", "company":"Nintendo"])
        
        consoles.document("nes")
            .setData(["name":"Nintendo Entertainment System", "company":"Nintendo"])
        
        let game1 = db.collection("games").document("0G9LMjIjFh5zaB8LMB8q")
        game1.setData(["platform":"SNES", "rating":"E", "year":"1990"], merge: true)
        
        let console1 = db.collection("consoles").document("snes")
        console1.updateData(["name":"Super NES", "units":"49 million", "year":"1990"])
*/
        let document = consoles.document("nes")
        
        document.getDocument { (docSnapshot, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let docSnapshot = docSnapshot {
                print(docSnapshot.data())
                print(docSnapshot.documentID)
            } else {
                print("No data returned")
            }
            
        }
        
        games.getDocuments { (querySnapshot, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let querySnapshot = querySnapshot {
                for doc in querySnapshot.documents {
                    print(doc.documentID)
                }
            } else {
                print("No data returned")
            }
            
        }
 
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
