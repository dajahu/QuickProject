//
//  CustomizableTextField.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-03.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import UIKit


// Sätter upp regler för textfält och gör dem synliga i editorn/storyboard mode.

@IBDesignable class CustomizableTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
        }
        
    }
    
}
