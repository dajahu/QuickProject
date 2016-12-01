//
//  UpdateKundTableViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-17.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class UpdateKundTableViewController: UITableViewController {

    
    
    @IBOutlet weak var kundNamnAddLabel: UITextField!
    @IBOutlet weak var kundOrgAddLabel: UITextField!
    @IBOutlet weak var kundAdressLabel: UITextField!
    
    @IBOutlet weak var kundKontaktPersonLabel: UITextField!
    @IBOutlet weak var kundKontaktPhoneLabel: UITextField!
    @IBOutlet weak var kundKontaktEmailLabel: UITextField!
    
    var kund: Kund!
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        kundNamnAddLabel.text = kund.kundNamn
        kundOrgAddLabel.text = kund.kundOrgNummer
        kundAdressLabel.text = kund.kundAdress
        kundKontaktPersonLabel.text = kund.kundKontaktPerson
        kundKontaktPersonLabel.text = kund.kundKontaktPhone
        kundKontaktEmailLabel.text = kund.kundKontaktEmail
        
        
    }
    
    
    @IBAction func updateAction(_ sender: AnyObject) {
        
        //Create the Colors for our Todo
        
        var kundNamn =  String()
        if kundNamnAddLabel.text == ""{
            
            kundNamnAddLabel.text = "Inget Kundnamn"
            kundNamn = kundNamnAddLabel.text!
        }else{
            
            kundNamn = kundNamnAddLabel.text!
        }
        
        var kundOrgNummer = String()
        
        if kundOrgAddLabel.text == "" {
            kundOrgAddLabel.text = "Inge Org nummer ifyllt"
            kundOrgNummer = kundOrgAddLabel.text!
        }else{
            kundOrgNummer = kundOrgAddLabel.text!
        }
        
        
        var kundAdress = String()
        
        if kundAdressLabel.text == "" {
            kundAdressLabel.text = "Ingen Adress tillgängligt"
            kundAdress = kundAdressLabel.text!
        }else{
            kundAdress = kundAdressLabel.text!
        }
        
        var kundKontaktPerson =  String()
        if kundKontaktPersonLabel.text == ""{
            
            kundKontaktPersonLabel.text = "No item name"
            kundKontaktPerson = kundKontaktPersonLabel.text!
        }else{
            
            kundKontaktPerson = kundKontaktPersonLabel.text!
        }
        
        var kundKontaktPhone = String()
        
        if kundKontaktPhoneLabel.text == "" {
            kundKontaktPhoneLabel.text = "No description for this Todo"
            kundKontaktPhone = kundKontaktPhoneLabel.text!
        }else{
            kundKontaktPhone = kundKontaktPhoneLabel.text!
        }
        
        
        var kundKontaktEmail = String()
        
        if kundKontaktEmailLabel.text == "" {
            kundKontaktEmailLabel.text = "No description for this Todo"
            kundKontaktEmail = kundKontaktEmailLabel.text!
        }else{
            kundKontaktEmail = kundKontaktEmailLabel.text!
        }
        
        
        let updateKund = Kund(kundCreatedBy: FIRAuth.auth()!.currentUser!.uid, kundNamn: kundNamn, kundAdress: kundAdress, kundOrgNummer: kundOrgNummer, kundKontaktPerson: kundKontaktPerson, kundKontaktPhone:kundKontaktPhone, kundKontaktEmail:kundKontaktEmail    )
        
        let key = kund.ref!.key
        
        let updateKundRef = databaseRef.child("/kunder/\(key)")
        
        updateKundRef.updateChildValues(updateKund.toAnyObject())
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    
    
}
