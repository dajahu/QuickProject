//
//  arbetsorderListTableViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-05.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseInstanceID
import FirebaseMessaging

class arbetsorderListTableViewController: UITableViewController {
    
    var arbetsorderArray = [arbetsorder]()
    
    var arbete: String = ""
    
    var databaseRef: FIRDatabaseReference!
    var storageRef: FIRStorageReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    func segmentedAction(){
        
        databaseRef = FIRDatabase.database().reference().child("arbetsorder")

        databaseRef.observe(.value, with: { (snapshot) in
            
            var newItems = [arbetsorder]()
            
            for item in snapshot.children {
                
                let newarbetsorder = arbetsorder(snapshot: item as! FIRDataSnapshot)
                newItems.insert(newarbetsorder, at: 0)
                
            }
            self.arbetsorderArray = newItems
            self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRows = arbetsorderArray.count

        return numberOfRows
    }
    

    override func viewWillAppear(_ animated: Bool) {
        

        if ((FIRAuth.auth()?.currentUser) == nil){
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
                   databaseRef = FIRDatabase.database().reference().child("arbetsorder")
            
            databaseRef.observe(.value, with: { (snapshot) in
                
                var newItems = [arbetsorder]()
                
                for item in snapshot.children {
                    
                    let newarbetsorder = arbetsorder(snapshot: item as! FIRDataSnapshot)
                    newItems.insert(newarbetsorder, at: 0)
                    
                }
                self.arbetsorderArray = newItems
                self.tableView.reloadData()
                
            }) { (error) in
                print(error.localizedDescription)
            }
            
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellArbetsorder", for: indexPath) as! arbetsorderTableViewCell
        
        // Configure the cell...
        cell.arbetsorderIdCell.text = arbetsorderArray[(indexPath as NSIndexPath).row].arbetsorderId
        cell.creatorCell.text = arbetsorderArray[(indexPath as NSIndexPath).row].emailOwner
        cell.statusCell.text = arbetsorderArray[(indexPath as NSIndexPath).row].status
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
            performSegue(withIdentifier: "updateraArbetsorder", sender: self)}
        
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            let ref = arbetsorderArray[(indexPath as NSIndexPath).row].ref
            ref!.removeValue()
            arbetsorderArray.remove(at: (indexPath as NSIndexPath).row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "updateraArbetsorder" {
                
                let vc = segue.destination as! updateArbetsorderViewController
                let indexPath = tableView.indexPathForSelectedRow!
                
                vc.Arbetsorders = arbetsorderArray[(indexPath as NSIndexPath).row]
       }
      }
    
}





