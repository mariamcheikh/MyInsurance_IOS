//
//  CustomDriversTableViewCell.swift
//  Assurance
//
//  Created by Mariam on 11/23/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class CustomDriversTableViewCell: UITableViewCell {

    @IBOutlet var id: UILabel!
    @IBOutlet var Name: UILabel!
    @IBOutlet var Prenom: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var Marque: UILabel!
    @IBOutlet var Model: UILabel!
    @IBOutlet var serie: UILabel!
    @IBOutlet var Ville: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
