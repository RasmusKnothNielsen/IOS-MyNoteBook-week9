//
//  CloudStorage.swift
//  FirebaseHelloWorld
//
//  Created by Rasmus Knoth Nielsen on 28/02/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import Foundation
import FirebaseFirestore

class CloudStorage {
    
    private static var list = [Note]()
    private static let db = Firestore.firestore()
    private static let collectionName = "notes"
    
    // CRUD
    
    // Create
    static func createNote(head: String, body: String) {
        
        let docRef = db.collection(collectionName).document()
        let newNote = Note(id: docRef.documentID, head: head, body: body)
        list.append(newNote)
        var map = [String:String]()
        map["head"] = head
        map["body"] = body
        docRef.setData(map)
        
    }
    
    // Get notes from firebase at startup
    static func getNotes() {
        db.collection(collectionName).getDocuments(completion: { (snapshot, error) in
            if error == nil {
                self.list.removeAll()
                for note in (snapshot!.documents) {
                    // Get a map of data from the note
                    let map = note.data()
                    let head = map["head"] as! String
                    let body = map["body"] as! String
                    // Creating the new node object
                    let newNote = Note(id: note.documentID, head: head, body: body)
                    // Add it to the list
                    self.list.append(newNote)
                }
            }
        })
    }
    
    // Read
    static func startListener() {
        // Continually listen for changes in the database.
        print("Starting listener")
        db.collection(collectionName).addSnapshotListener { (snapshot, error) in
            if error == nil {
                // Clears the list to be able to show all the new notes and only these
                self.list.removeAll()
                for note in (snapshot!.documents) {
                    // Get a map of data from the note
                    let map = note.data()
                    let head = map["head"] as! String
                    let body = map["body"] as! String
                    // Creating the new node object
                    let newNote = Note(id: note.documentID, head: head, body: body)
                    // Add it to the list
                    self.list.append(newNote)
                }
            }
        }
    }
    
    // Update
    static func updateNote(index:Int, head:String, body:String) {
        let note = list[index]
        //let newNote = Note(id: note.id, head: head, body: body)
        let docRef = db.collection(collectionName).document(note.id)
        var map = [String:String]()
        map["head"] = head
        map["body"] = body
        docRef.setData(map)
    }
    
    // Delete
    static func deleteNote(index: Int, id:String){
        // Document Reference
        let docRef = db.collection(collectionName).document(id)
        list.remove(at: index)
        docRef.delete()
    }
    
    // Count
    static func count() -> Int {
        return list.count
    }
    
    // Get note from List
    static func getNote(index: Int) -> Note {
        print("Index: \(index)")
        return list[index]
    }
    
}
