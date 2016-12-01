//
//  arbetsorder.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-02.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

//uppsättninga av todo-arbetsorder



class arbetsorder {
    
    //Email som vi binder till den som skapade/ändrade order senast
    var emailOwner: String!
    var arbetsorderOwner: String!
    
        
    //Order Information
    var arbetsorderId: String!
    var arbetsorderKund: String!
    var arbetsorderProjekt: String!
    
    //Text för arbets Besskrivning
    var arbetsBeskrivning: String!
    
    //Vi sk addera möjlighet för bild och länk till pdf.
    // Lägg det här 
    
    // Kontaktiformation till Ansvariga
    var arbetsorderKontaktPerson: String!
    var arbetsorderKontaktInformation: String!
    
    //Arbetsordern status
    
    var status: String!
    
    //Vilka jobbar med order/har tillgång
    //läggas till här
    
    //Databas firebase reference
    var ref: FIRDatabaseReference?
    var key:String!
    
    
    // sätter upp initializing
    init(emailOwner: String, arbetsorderOwner: String, arbetsorderId: String, arbetsorderKund: String, arbetsorderProjekt: String, arbetsBeskrivning: String, arbetsorderKontaktPerson: String, arbetsorderKontaktInformation: String, status: String, key: String = ""){
        
        // initializing  var
        
        self.emailOwner = emailOwner
        self.arbetsorderOwner = arbetsorderOwner
        
        self.arbetsorderId = arbetsorderId
        self.arbetsorderKund = arbetsorderKund
        self.arbetsorderProjekt = arbetsorderProjekt
        
        self.arbetsBeskrivning = arbetsBeskrivning
        
       
        
        self.arbetsorderKontaktPerson = arbetsorderKontaktPerson
        self.arbetsorderKontaktInformation = arbetsorderKontaktInformation
        
        
        self.status = status
        
        
        self.key = key
        self.ref = FIRDatabase.database().reference()
        
    }
    // initializing  var till firebase
    init(snapshot: FIRDataSnapshot){
        
        self.emailOwner = (snapshot.value as? NSDictionary)?["emailOwner"] as! String!
        self.arbetsorderOwner = (snapshot.value as? NSDictionary)?["arbetsorderOwner"] as? String
        
        
        
        self.arbetsorderId = (snapshot.value as? NSDictionary)?["arbetsorderId"] as? String
        self.arbetsorderKund = (snapshot.value as? NSDictionary)?["arbetsorderKund"] as? String
        self.arbetsorderProjekt = (snapshot.value as? NSDictionary)?["arbetsorderProjekt"] as? String
        
        self.arbetsBeskrivning = (snapshot.value as? NSDictionary)?["arbetsBeskrivning"] as? String
        
        self.arbetsorderKontaktPerson = (snapshot.value as? NSDictionary)?["arbetsorderKontaktPerson"] as? String
        self.arbetsorderKontaktInformation = (snapshot.value as? NSDictionary)?["arbetsorderKontaktInformation"] as? String
        
        self.status = (snapshot.value as? NSDictionary)?["status"] as? String
       
        
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    //retunerar med func
    
    func toAnyObject() -> [String: AnyObject] {
        return ["emailOwner": emailOwner as AnyObject, "arbetsorderOwner": arbetsorderOwner as AnyObject, "arbetsorderId": arbetsorderId as AnyObject, "arbetsorderKund": arbetsorderKund as AnyObject, "arbetsorderProjekt": arbetsorderProjekt as AnyObject, "arbetsBeskrivning": arbetsBeskrivning as AnyObject, "arbetsorderKontaktPerson": arbetsorderKontaktPerson as AnyObject, "arbetsorderKontaktInformation": arbetsorderKontaktInformation as AnyObject, "status": status as AnyObject]
    }
    
}

