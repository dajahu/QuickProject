//
//  Friends.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-09-02.
//  Copyright © 2016 A-Note AB. All rights reserved.
//




import Foundation
import Firebase
import FirebaseDatabase

//uppsättninga av vänner



struct friends {
    
    
    var userUID: String!
    var ref: FIRDatabaseReference?
    var key:String!
    
    
    // sätter upp initializing
    init( userUID: String, key: String = ""){
        
        // initializing  var
        
        self.userUID = userUID
        self.key = key
        self.ref = FIRDatabase.database().reference()
        
    }
    // initializing  var till firebase
    init(snapshot: FIRDataSnapshot){
        
        
        self.userUID = (snapshot.value as? NSDictionary)?["userUID"] as? String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    //retunerar med func
    
    func toAnyObject() -> [String: AnyObject] {
        return ["userUID": userUID as AnyObject]
    }
    
}

