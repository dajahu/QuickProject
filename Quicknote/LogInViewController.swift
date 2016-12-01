//
//  LogInViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-09.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

   
    @IBOutlet weak var emailTextField: CustomizableTextField!
    
    @IBOutlet weak var passwordTextField: CustomizableTextField!

    let networkingService = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwindToLogIn(_ storyboard:UIStoryboardSegue){
    }
    
    
    
    @IBAction func logInAction(_ sender: AnyObject) {
        networkingService.signIn(emailTextField.text!, password: passwordTextField.text!)
        
    }
    
    
}
