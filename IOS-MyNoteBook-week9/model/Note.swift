//
//  Note.swift
//  FirebaseHelloWorld
//
//  Created by Rasmus Knoth Nielsen on 28/02/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import Foundation

class Note {
    // Fields
    var id:String
    var head:String
    var body:String
    
    // Initializer (Constructor)
    init(id:String, head:String, body:String) {
        self.id = id
        self.head = head
        self.body = body
    }
    
}

