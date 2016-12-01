//
//  Todo-kund.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-02.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

//uppsättninga av todo-kund



struct Kund {
    
    var kundCreatedBy: String!
    
    var kundNamn: String!
    var kundAdress: String!
    var kundOrgNummer: String!
    
    
    var kundKontaktPerson: String!
    var kundKontaktPhone: String!
    var kundKontaktEmail: String!
    
    var ref: FIRDatabaseReference?
    var key:String!
    
    
    // sätter upp initializing
    init(kundCreatedBy: String, kundNamn: String, kundAdress: String, kundOrgNummer: String, kundKontaktPerson: String, kundKontaktPhone: String, kundKontaktEmail: String, key: String = ""){
        
        // initializing  var
        
        self.kundCreatedBy = kundCreatedBy
        
        self.kundNamn = kundNamn
        self.kundAdress = kundAdress
        self.kundOrgNummer = kundOrgNummer
        
        self.kundKontaktPerson = kundKontaktPerson
        self.kundKontaktPhone = kundKontaktPhone
        self.kundKontaktEmail = kundKontaktEmail
        
        self.key = key
        self.ref = FIRDatabase.database().reference()
        
    }
    // initializing  var till firebase
    init(snapshot: FIRDataSnapshot){
        
        self.kundCreatedBy = (snapshot.value as? NSDictionary)?["kundCreatedBy"] as? String
        
        
        self.kundNamn = (snapshot.value as? NSDictionary)?["kundNamn"] as? String
        self.kundAdress = (snapshot.value as? NSDictionary)?["kundAdress"] as? String
        self.kundOrgNummer = (snapshot.value as? NSDictionary)?["kundOrgNummer"] as? String
        
        self.kundKontaktPerson = (snapshot.value as? NSDictionary)?["kundKontaktPerson"] as? String
        self.kundKontaktPhone = (snapshot.value as? NSDictionary)?["kundKontaktPhone"] as? String
        self.kundKontaktEmail = (snapshot.value as? NSDictionary)?["kundKontaktEmail"] as? String
        
        self.key = snapshot.key
        self.ref = snapshot.ref
        
        
    }
    
    //retunerar med func
    
    func toAnyObject() -> [String: AnyObject] {
        return ["kundCreatedBy": kundCreatedBy as AnyObject, "kundNamn": kundNamn as AnyObject, "kundAdress": kundAdress as AnyObject, "kundOrgNummer": kundOrgNummer as AnyObject, "kundKontaktPerson": kundKontaktPerson as AnyObject, "kundKontaktPhone": kundKontaktPhone as AnyObject,  "kundKontaktEmail": kundKontaktEmail as AnyObject]
    }
    
}

