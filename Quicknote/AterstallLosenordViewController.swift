//
//  AterstallLosenordViewController.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-10.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit

class AterstallLosenordViewController: UIViewController {

    @IBOutlet weak var emailTextField: CustomizableTextField!
    
    let networkingService = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func resetPasswordAction(_ sender: AnyObject) {
        
        networkingService.resetPassword(emailTextField.text!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
