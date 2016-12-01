//
//  updateArbetsorderViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-05.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class updateArbetsorderViewController: UITableViewController{


    @IBOutlet weak var arbertsorderIdLabel: UITextField!
    @IBOutlet weak var arbetsorderKundLabel: UITextField!
    @IBOutlet weak var arbetsorderProjektLabel: UITextField!
    
    @IBOutlet weak var arbetsBeskrivningLabel: UITextView!
    
    @IBOutlet weak var arbetsorderKontaktpersonLabel: UITextField!
    @IBOutlet weak var arbetsorderKontaktInformationLabel: UITextField!
    
    @IBOutlet weak var statusLabel: UITextField!
    
        var Arbetsorders: arbetsorder!
        
        var databaseRef: FIRDatabaseReference! {
            return FIRDatabase.database().reference()
        }
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            arbertsorderIdLabel.text = Arbetsorders.arbetsorderId
            arbetsorderKundLabel.text = Arbetsorders.arbetsorderKund
            arbetsorderProjektLabel.text = Arbetsorders.arbetsorderProjekt
            
            arbetsBeskrivningLabel.text = Arbetsorders.arbetsBeskrivning
            
            arbetsorderKontaktpersonLabel.text = Arbetsorders.arbetsorderKontaktPerson
            arbetsorderKontaktInformationLabel.text = Arbetsorders.arbetsorderKontaktInformation
            statusLabel.text = Arbetsorders.status
          
            
        }
    
 
    
    
    
    
        
        @IBAction func updateAction(_ sender: AnyObject) {
            
            //Create the Colors for our Todo
            
            
            // Kolla att information anges
            
           
            var arbetsorderId = String()
            if arbertsorderIdLabel.text == ""{
                
                arbertsorderIdLabel.text = "Inget id på arbets arbetsorder"
                arbetsorderId = arbertsorderIdLabel.text!
                
            }else{
                arbetsorderId = arbertsorderIdLabel.text!
            }
            
            var arbetsorderKund = String()
            if arbetsorderKundLabel.text == "" {
                arbetsorderKundLabel.text = "Ingen kund för denna arbetsorder"
                arbetsorderKund = arbetsorderKundLabel.text!
            }else{
                arbetsorderKund = arbetsorderKundLabel.text!
            }
            
            var arbetsorderProjekt = String()
            if arbetsorderProjektLabel.text == "" {
                arbetsorderProjektLabel.text = "Ingen kund för denna arbetsorder"
                arbetsorderProjekt = arbetsorderProjektLabel.text!
            }else{
                arbetsorderProjekt = arbetsorderProjektLabel.text!
            }
            
            var arbetsBeskrivning = String()
            if arbetsBeskrivningLabel.text == "" {
                arbetsBeskrivningLabel.text = "Ingen kund för denna arbetsorder"
                arbetsBeskrivning = arbetsBeskrivningLabel.text!
            }else{
                arbetsBeskrivning = arbetsBeskrivningLabel.text!
            }
            
            var arbetsorderKontaktPerson = String()
            if arbetsorderKontaktpersonLabel.text == "" {
                arbetsorderKontaktpersonLabel.text = "Ingen kund för denna arbetsorder"
                arbetsorderKontaktPerson = arbetsorderKontaktpersonLabel.text!
            }else{
                arbetsorderKontaktPerson = arbetsorderKontaktpersonLabel.text!
            }
            
            var arbetsorderKontaktInformation = String()
            if arbetsorderKontaktInformationLabel.text == "" {
                arbetsorderKontaktInformationLabel.text = "Ingen kund för denna arbetsorder"
                arbetsorderKontaktInformation = arbetsorderKontaktInformationLabel.text!
            }else{
                arbetsorderKontaktInformation = arbetsorderKontaktInformationLabel.text!
            }

            
            var status = String()
            if statusLabel.text == "" {
                statusLabel.text = "Ingen kund för denna arbetsorder"
                status = statusLabel.text!
            }else{
                status = statusLabel.text!
            }
            
            
            let updatedArbetsorder = arbetsorder(emailOwner: FIRAuth.auth()!.currentUser!.email!,arbetsorderOwner: FIRAuth.auth()!.currentUser!.uid, arbetsorderId: arbetsorderId, arbetsorderKund: arbetsorderKund, arbetsorderProjekt: arbetsorderProjekt,  arbetsBeskrivning: arbetsBeskrivning,  arbetsorderKontaktPerson: arbetsorderKontaktPerson,  arbetsorderKontaktInformation: arbetsorderKontaktInformation, status: status )
            
            let key = Arbetsorders.ref!.key
            
          
            //skapa en tabell referense i firebase database
            
            
            let updateRef = databaseRef.child("/arbetsorder/\(key)")
            
            updateRef.updateChildValues(updatedArbetsorder.toAnyObject())
            
            self.navigationController?.popToRootViewController(animated: true)
            
            
        }
        


}
