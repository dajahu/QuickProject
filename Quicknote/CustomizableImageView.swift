//
//  CustomizableImageView.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-03.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import Foundation
import UIKit


// Sätter upp regler för Image och gör dem synliga i editorn/storyboard mode.

@IBDesignable class CustomizableImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cornerRadius
            
        }
    }

    @IBInspectable var borderWith: CGFloat = 0 {
        
        didSet {
            
            layer.borderWidth = borderWith
            
        }
    }
    
    
    
}
