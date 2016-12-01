//
//  AddKundTableViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-17.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class AddKundTableViewController: UITableViewController {
    
    
    @IBOutlet weak var kundNamnAddLabel: UITextField!
    @IBOutlet weak var kundOrgAddLabel: UITextField!
    @IBOutlet weak var kundAdressLabel: UITextField!
    
    
    @IBOutlet weak var kundKontaktNamnLabel: UITextField!
    @IBOutlet weak var kundKontaktPhoneLabel: UITextField!
    @IBOutlet weak var kundKontaktEmailLabel: UITextField!
    
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    //
    //    // MARK: - Table view data source
    //
    //    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    
    
    
    
    
    @IBAction func saveAction(_ sender: AnyObject) {
        
        //skapa en tabell referense i firebase database
        let kundRef = databaseRef.child("kunder").childByAutoId()
        
        // skapa en färgkoppling till list items
        
        
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
        if kundKontaktNamnLabel.text == ""{
            
            kundKontaktNamnLabel.text = "No item name"
            kundKontaktPerson = kundKontaktNamnLabel.text!
        }else{
            
            kundKontaktPerson = kundKontaktNamnLabel.text!
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
        
        
        let kund = Kund(kundCreatedBy: FIRAuth.auth()!.currentUser!.uid, kundNamn: kundNamn, kundAdress: kundAdress, kundOrgNummer: kundOrgNummer, kundKontaktPerson: kundKontaktPerson, kundKontaktPhone:kundKontaktPhone, kundKontaktEmail:kundKontaktEmail    )
        
        kundRef.setValue(kund.toAnyObject())
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    /*
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
}
