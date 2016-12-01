//
//  MyProfileViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-10.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class MyProfileViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userImageView: CustomizableImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
 
    
    var urlImage : String!
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorage! {
        return FIRStorage.storage()
    }
    
    

//    @IBAction func updateEmailAction(sender: AnyObject) {
//
//        if let user = FIRAuth.auth()?.currentUser {
//            
//            user.updateEmail(email.text!, completion: { (error) in
//                if let error = error{
//                    print(error.localizedDescription)
//                }else {
//                    let alertView = UIAlertView(title: "Update Email", message: "You have successfully updated your email", delegate: self, cancelButtonTitle: "OK, Thanks")
//                    alertView.show()
//                }
//            })
//        }
//        
//        
//        
//        
//    }
//
//    @IBAction func updatePasswordAction(sender: AnyObject) {
//        
//        if let user = FIRAuth.auth()?.currentUser {
//            
//            user.updatePassword(password.text!, completion: { (error) in
//                if let error = error{
//                    print(error.localizedDescription)
//                }else {
//                    let alertView = UIAlertView(title: "Update Password", message: "You have successfully updated your password", delegate: self, cancelButtonTitle: "OK, Thanks")
//                    alertView.show()
//                    
//                    
//                    
//                }
//            })
//        }
//        
//        
//    }
//    
//    @IBAction func deleteAccount(sender: AnyObject) {
//        
//        let user = FIRAuth.auth()?.currentUser
//        user?.deleteWithCompletion({ (error) in
//            if let error = error{
//                print(error.localizedDescription)
//            }else {
//                let alertView = UIAlertView(title: "Delete Account", message: "You have successfully deleted your acoount. We are sorry to see you leaving us this way.", delegate: self, cancelButtonTitle: "OK, Thanks")
//                alertView.show()
//                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
//                self.presentViewController(vc, animated: true, completion: nil)
//            }
//        })
//        
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        if FIRAuth.auth()?.currentUser == nil {
//            
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
//            presentViewController(vc, animated: true, completion: nil)
//        }
//        else {
//            databaseRef.child("users/\(FIRAuth.auth()!.currentUser!.uid)").observeEventType(.Value, withBlock: { (snapshot) in
//                dispatch_async(dispatch_get_main_queue(), {
//                    
//                    let user = User(snapshot: snapshot)
//                    self.username.text = user.username
//                    self.email.text = FIRAuth.auth()?.currentUser?.email
//                    
//                    let imageUrl = String(user.photoUrl)
//                    
//                    self.storageRef.referenceForURL(imageUrl).dataWithMaxSize(1 * 1024 * 1024, completion: { (data, error) in
//                        
//                        if let error = error {
//                            print(error.localizedDescription)
//                        }else {
//                            if let data = data {
//                                self.userImageView.image = UIImage(data: data)
//                            }
//                        }
//                    })
//                    
//                    
//                    
//                    
//                    
//                })
//                
//                
//            }) { (error) in
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    @IBAction func logOutAction(_ sender: AnyObject) {
        
        if FIRAuth.auth()?.currentUser != nil {
            
            do {
                
                try  FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}
