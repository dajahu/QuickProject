//
//  Comment.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-02.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

//sätter up variabler för använder info vid commentarer.
struct Comment {
    
    var userImageStringUrl: String!
    var postId: String!
    var content: String!
    var username: String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    
    init(postId: String, userImageStringUrl: String, content: String, username: String, key: String = ""){
        
        self.content = content
        self.postId = postId
        self.username = username
        self.userImageStringUrl = userImageStringUrl
        self.ref = FIRDatabase.database().reference()
    }
    
    //Kopplingar till firebase
    init(snapshot: FIRDataSnapshot){
        
        self.content = (snapshot.value as? NSDictionary)?["content"] as! String
        self.postId = (snapshot.value as? NSDictionary)?["postId"] as! String
        
        self.username = (snapshot.value as? NSDictionary)?["username"] as! String
        self.userImageStringUrl = (snapshot.value as? NSDictionary)?["userImageStringUrl"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
        
    }
    
    //Return av information
    
    func toAnyObject() -> [String: AnyObject] {
        return ["userImageStringUrl": userImageStringUrl as AnyObject, "content": content as AnyObject, "username": username as AnyObject, "postId":postId as AnyObject]
    }
    
    
}
