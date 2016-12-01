//
//  addArbetsorderTableViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-03.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class addArbetsorderTableViewController: UITableViewController  {
    

    @IBOutlet weak var arbertsorderIdLabel: UITextField!
    @IBOutlet weak var arbetsorderKundLabel: UITextField!
    @IBOutlet weak var arbetsorderProjektLabel: UITextField!
    
    @IBOutlet weak var arbetsBeskrivningLabel: UITextView!
    
    @IBOutlet weak var arbetsorderKontaktpersonLabel: UITextField!
    @IBOutlet weak var arbetsorderKontaktInformationLabel: UITextField!
    @IBOutlet weak var statusLabel: UITextField!
   
    @IBOutlet weak var userName: UITextField!

    //fejkad outlet för att spara som text
    
    
  
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    
    // Alternativ för arbetsorder status!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func addWorker(_ sender: AnyObject) {
        
        let usernameEntered = self.userName.text!
        let arbertsorderId = self.arbertsorderIdLabel.text!
        let kundRef = databaseRef.child("Worklist").child(arbertsorderId).childByAutoId()
        
        databaseRef.child("users").queryOrdered(byChild: "username").queryEqual(toValue: usernameEntered).observeSingleEvent(of: .value, with: {(snap) in
            if let snapDict = snap.value as? [String:AnyObject] {
              
                    
                    kundRef.setValue(snapDict)
                    
            
                }
            
        })}

    
    
    
    
    
    @IBAction func saveAction(_ sender: AnyObject) {
           let projektID = self.arbetsorderProjektLabel.text!
       
        //skapa en tabell referense i firebase database
//        let arbetsorderRef = databaseRef.child("projekt").child("arbetsorder").childByAutoId()
        
        // skapa en färgkoppling till list items
        
        let arbetsorderRef = databaseRef.child("arbetsorder").childByAutoId()
        let newPostKey = arbetsorderRef.key
        // Create the data we want to update
        let updatedUserData = ["users/\(FIRAuth.auth()?.currentUser!.uid)/posts/\(newPostKey)": true, "projekt/\(projektID)": ["title": "New t", "content": "Here is my new post!"]] as [String : Any]
        // Do a deep-path update
        databaseRef.updateChildValues(updatedUserData, withCompletionBlock: { (error, ref) -> Void in
            if ((error) != nil) {
                print("Error updating data: \(error)")
            }
        })
        
        // Kolla att information anges
        
        
        
        var arbetsorderId = String()
        if arbertsorderIdLabel.text == ""{
            
            arbertsorderIdLabel.text = "Inget ID på arbets arbetsorder"
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
            arbetsorderKundLabel.text = "Inget projekt för denna arbetsorder"
            arbetsorderProjekt = arbetsorderKundLabel.text!
        }else{
            arbetsorderProjekt = arbetsorderKundLabel.text!
        }
        
        var arbetsBeskrivning = String()
        if arbetsBeskrivningLabel.text == "" {
            arbetsBeskrivningLabel.text = "Ingen beskrvining finns för denna arbetsorder"
            arbetsBeskrivning = arbetsBeskrivningLabel.text!
        }else{
            arbetsBeskrivning = arbetsBeskrivningLabel.text!
        }
        
        var arbetsorderKontaktPerson = String()
        if arbetsorderKontaktpersonLabel.text == "" {
            arbetsorderKundLabel.text = "Ingen kund för denna arbetsorder"
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

        
        let arbete = arbetsorder(emailOwner: FIRAuth.auth()!.currentUser!.email!,arbetsorderOwner: FIRAuth.auth()!.currentUser!.uid, arbetsorderId: arbetsorderId, arbetsorderKund: arbetsorderKund, arbetsorderProjekt: arbetsorderProjekt,  arbetsBeskrivning: arbetsBeskrivning,  arbetsorderKontaktPerson: arbetsorderKontaktPerson,  arbetsorderKontaktInformation: arbetsorderKontaktInformation, status: status )
        
        arbetsorderRef.setValue(arbete.toAnyObject())
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
