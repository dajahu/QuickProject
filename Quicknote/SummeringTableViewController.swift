//
//  SummeringTableViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-09-01.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseInstanceID
import FirebaseMessaging

class SummeringTableViewController: UITableViewController, UISearchBarDelegate {
    
    var arbetsorderArray = [arbetsorder]()
    var filteredArbetsorderArray = [arbetsorder]()
    
    
    @IBOutlet var searchBar:UISearchBar!

    var arbete: String = ""
    
    var databaseRef: FIRDatabaseReference!
    var storageRef: FIRStorageReference!
    
    var databaseRef2: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
      searchBar.delegate = self
        
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        self.searchBar.showsCancelButton = true

        databaseRef = FIRDatabase.database().reference().child("arbetsorder")
        
        databaseRef.queryOrdered(byChild: "arbetsorderProjekt").queryEqual(toValue: searchText).observe(.value, with: { (snapshot) in
            
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

    
    
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar, searchTextEntered: String) {
//        databaseRef = FIRDatabase.database().reference().child("arbetsorder")
//        
//        databaseRef.queryOrdered(byChild: "arbetsorderProjekt").queryStarting(atValue: searchTextEntered).observe(.value, with: { (snapshot) in
//            
//            var newItems = [arbetsorder]()
//            
//            for item in snapshot.children {
//                
//                let newarbetsorder = arbetsorder(snapshot: item as! FIRDataSnapshot)
//                newItems.insert(newarbetsorder, at: 0)
//                
//            }
//            self.arbetsorderArray = newItems
//            self.tableView.reloadData()
//            
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
    
    
    
 
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
    
    
    
//********************
//    func segmentedAction(){
//        
//     
//        
//        databaseRef = FIRDatabase.database().reference().child("arbetsorder")
//        
//        databaseRef.queryOrdered(byChild: "arbetsorderProjekt").queryEqual(toValue: projektName).observe(.value, with: { (snapshot) in
//            
//            var newItems = [arbetsorder]()
//            
//            for item in snapshot.children {
//                
//                let newarbetsorder = arbetsorder(snapshot: item as! FIRDataSnapshot)
//                newItems.insert(newarbetsorder, at: 0)
//                
//            }
//            self.arbetsorderArray = newItems
//            self.tableView.reloadData()
//            
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//    }
    
//********************
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
//********************
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRows = arbetsorderArray.count
        
        return numberOfRows
    }
    
//********************
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if ((FIRAuth.auth()?.currentUser) == nil){
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
            self.present(vc, animated: true, completion: nil)
            
        }
//        
//        var projektName = String()
//        if self.searchBar.text == "" {
//            self.searchBar.text = ""
//            projektName = self.searchBar.text!
//        }else{
//            projektName = self.searchBar.text!
//        }
//
//        print(projektName)
//        
//        databaseRef = FIRDatabase.database().reference().child("arbetsorder")
//        
//        databaseRef.queryOrdered(byChild: "arbetsorderProjekt").queryEqual(toValue: projektName).observe(.value, with: { (snapshot) in
//            
//            var newItems = [arbetsorder]()
//            
//            for item in snapshot.children {
//                
//                let newarbetsorder = arbetsorder(snapshot: item as! FIRDataSnapshot)
//                newItems.insert(newarbetsorder, at: 0)
//                
//            }
//            self.arbetsorderArray = newItems
//            self.tableView.reloadData()
//            
//        }) { (error) in
//            print(error.localizedDescription)
//        }
//        
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellArbetsorder", for: indexPath) as! arbetsorderTableViewCell
        
        // Configure the cell...
        cell.arbetsorderIdCell.text = arbetsorderArray[(indexPath as NSIndexPath).row].arbetsorderId
//        cell.creatorCell.text = arbetsorderArray[(indexPath as NSIndexPath).row].emailOwner
//        cell.statusCell.text = arbetsorderArray[(indexPath as NSIndexPath).row].status
        return cell
        
    }
    
    // Förbereder för att skicka data till specefik order
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
    
    //Skickar datan till specefik order
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "updateraArbetsorder" {
            
            let vc = segue.destination as! updateArbetsorderViewController
            let indexPath = tableView.indexPathForSelectedRow!
            
            vc.Arbetsorders = arbetsorderArray[(indexPath as NSIndexPath).row]
        }
    }
    
}





