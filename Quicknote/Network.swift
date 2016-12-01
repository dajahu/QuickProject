//
//  NetworkingService.swift
//
//
//  Created by Frezy Stone Mboumba on 7/1/16.
//
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import UIKit


struct Network {
    
    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    var storageRef: FIRStorageReference {
        return FIRStorage.storage().reference()
    }
    
    
    
    // 3 --- Saving the user Info in the database
    fileprivate func saveInfo(_ user: FIRUser!, username: String, password: String){
        
        // Create our user dictionary info\
        
        let userInfo = ["email": user.email!, "username": username, "uid": user.uid, "photoUrl": String(describing: user.photoURL!)]
        
        // create user reference
        
        let userRef = databaseRef.child("users").child(user.uid)
        
        // Save the user info in the Database
        
        userRef.setValue(userInfo)
        
        
        // Signing in the user
        signIn(user.email!, password: password)
        
    }
    
    
    // 4 ---- Signing in the User
    func signIn(_ email: String, password: String){
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error == nil {
                
                if let user = user {
                    
                    print("\(user.displayName!) has signed in succesfully!")
                    
                    let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDel.logUser()
                    
                }
                
            }else {
                
                print(error!.localizedDescription)
                
            }
        })
        
    }
    
    // 2 ------ Set User Info
    
    fileprivate func setUserInfo(_ user: FIRUser!, username: String, password: String, data: Data!){
        
        //Create Path for the User Image
        let imagePath = "profileImage\(user.uid)/userPic.jpg"
        
        
        // Create image Reference
        
        let imageRef = storageRef.child(imagePath)
        
        // Create Metadata for the image
        
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpeg"
        
        // Save the user Image in the Firebase Storage File
        
        imageRef.put(data, metadata: metaData) { (metaData, error) in
            if error == nil {
                
                let changeRequest = user.profileChangeRequest()
                changeRequest.displayName = username
                changeRequest.photoURL = metaData!.downloadURL()
                changeRequest.commitChanges(completion: { (error) in
                    
                    if error == nil {
                        
                        self.saveInfo(user, username: username, password: password)
                        
                    }else{
                        print(error!.localizedDescription)
                        
                    }
                })
                
                
            }else {
                print(error!.localizedDescription)
                
            }
        }
        
        
        
        
        
    }
    // Reset Password
    func resetPassword(_ email: String){
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            if error == nil {
                print("An email with information on how to reset your password has been sent to you. thank You")
            }else {
                print(error!.localizedDescription)
                
            }
        })
        
    }
    
    // 1 ---- We create the User
    
    func signUp(_ email: String, username: String, password: String,  data: Data!){
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error == nil {
                
                self.setUserInfo(user, username: username, password: password, data: data)
                
            }else {
                print(error!.localizedDescription)
                
            }
        })
        
        
    }
    
    
    
    
    
    
    
}
