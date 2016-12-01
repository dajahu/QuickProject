//
//  KundTableViewCell.swift
//  Quicknote
//
//  Created by David Hultgren on 2016-08-17.
//  Copyright © 2016 A-Note AB. All rights reserved.
//

import UIKit

class kundTableViewCell: UITableViewCell {

   
    @IBOutlet weak var kundNamnLabel: UILabel!
    @IBOutlet weak var kundkontaktPersonLabel: UILabel!
    @IBOutlet weak var kundkontaktEmailLabel: UILabel!
    @IBOutlet weak var kundkontaktPhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
