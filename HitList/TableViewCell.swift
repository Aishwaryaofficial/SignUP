//
//  TableViewCell.swift
//  HitList
//
//  Created by Appinventiv on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK : @IBOutlet
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textFieldInfo: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
