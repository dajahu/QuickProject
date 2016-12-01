//
//  Post.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-03.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage



// sätter up struct för poster

struct Posts {
    var postImageStringUrl: String!
    var userImageStringUrl: String!
    var postId: String!
    var content: String!
    var username: String!
    var ref: FIRDatabaseReference?
    var key: String!
    
    
    //installerar variblarna
    
    init(postImageStringUrl: String, postId: String, userImagesStringUrl: String, content: String, username: String, key: String = ""){
        
        self.postImageStringUrl = postImageStringUrl
        self.content = content
        self.postId = postId
        self.username = username
        self.ref = FIRDatabase.database().reference()
    
    }
    
      //installerar variblarna koppling till firebase
    
    init(snapshot: FIRDataSnapshot){
        
        self.postImageStringUrl = (snapshot.value as? NSDictionary)?["postImageStringUrl"] as! String
        self.content = (snapshot.value as? NSDictionary)?["content"] as! String
        self.postId = (snapshot.value as? NSDictionary)?["postId"] as! String
        self.username = (snapshot.value as? NSDictionary)?["snapshot"] as! String
        self.userImageStringUrl = (snapshot.value as? NSDictionary)?["userImageStringUrl"] as! String
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    // Sätt up funktion för return av data/information
    
    func toAnyObject() -> [String: AnyObject] {
        return ["postImagesStringUrl": postImageStringUrl as AnyObject, "userImagesStringUrl": userImageStringUrl as AnyObject, "content": content as AnyObject, "username": username as AnyObject, "postId": postId as AnyObject]
    }
    
    
    
}
