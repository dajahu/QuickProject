//
//  KundListTableViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-17.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseInstanceID
import FirebaseMessaging

class KundListTableViewController: UITableViewController {
    var kundArray = [Kund]()
    
    var arbete: String = ""
    
    var databaseRef: FIRDatabaseReference!
    var storageRef: FIRStorageReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        
        
    }
    
    
    
    
    
    func segmentedAction(){
        
        databaseRef = FIRDatabase.database().reference().child("kunder")
        
        
        
        
        databaseRef.observe(.value, with: { (snapshot) in
            
            var newKund = [Kund]()
            
            for item in snapshot.children {
                
                let newKundTodo = Kund(snapshot: item as! FIRDataSnapshot)
                newKund.insert(newKundTodo, at: 0)
                
            }
            self.kundArray = newKund
            self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arbete == arbete {
            return 110
        }else {
            return 288
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRows = kundArray.count
        
        
        
        return numberOfRows
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        if ((FIRAuth.auth()?.currentUser) == nil){
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
            self.present(vc, animated: true, completion: nil)
            
            
        }
        
        if arbete == arbete {
            databaseRef = FIRDatabase.database().reference().child("kunder")
            
            databaseRef.observe(.value, with: { (snapshot) in
                
                var newKund = [Kund]()
                
                for item in snapshot.children {
                    
                    let newKundTodo = Kund(snapshot: item as! FIRDataSnapshot)
                    newKund.insert(newKundTodo, at: 0)
                    
                }
                self.kundArray = newKund
                self.tableView.reloadData()
                
            }) { (error) in
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKund", for: indexPath) as! kundTableViewCell
        
        // Configure the cell...
        cell.kundNamnLabel.text = kundArray[(indexPath as NSIndexPath).row].kundNamn
        cell.kundkontaktPersonLabel.text = kundArray[(indexPath as NSIndexPath).row].kundKontaktPerson
        cell.kundkontaktEmailLabel.text = kundArray[(indexPath as NSIndexPath).row].kundKontaktEmail
        cell.kundkontaktPhoneLabel.text = kundArray[(indexPath as NSIndexPath).row].kundKontaktPhone

        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if arbete == arbete {
            performSegue(withIdentifier: "updateraKund", sender: self)}
        else {
            performSegue(withIdentifier: "addComment", sender: self)
        }
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            let ref = kundArray[(indexPath as NSIndexPath).row].ref
            ref!.removeValue()
            kundArray.remove(at: (indexPath as NSIndexPath).row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if arbete == arbete{
            if segue.identifier == "updateraKund" {
                
                let vc = segue.destination as! UpdateKundTableViewController
                let indexPath = tableView.indexPathForSelectedRow!
                
                vc.kund = kundArray[(indexPath as NSIndexPath).row]
            }
        }else {
            if segue.identifier == "addComment" {
                
                //                let vc = segue.destinationViewController as! CommentTableViewController
                let indexPath = tableView.indexPathForSelectedRow!
                
                
                
                
            }
            
        }
        
        
    }
}




