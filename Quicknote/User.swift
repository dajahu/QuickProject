//
//  User.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-02.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

//Deklarer kopplingar till användares data som sparas.
struct User {
    
    
    
    var email: String!
    var photoUrl: String!
    var ref: FIRDatabaseReference?
    var key: String
    
    init(snapshot: FIRDataSnapshot){
        
        key = snapshot.key
       
        email = (snapshot.value as? NSDictionary)?["email"] as! String
        photoUrl = (snapshot.value as? NSDictionary)?["photoUrl"] as! String
        ref = snapshot.ref
        
    }
    
    
}
