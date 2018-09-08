//
//  CustomConstatTableViewCell.swift
//  Assurance
//
//  Created by Mariam on 12/6/17.
//  Copyright © 2017 Mariam. All rights reserved.
//

import UIKit

class CustomConstatTableViewCell: UITableViewCell {

    @IBOutlet var labelnomConducA: UILabel!
    @IBOutlet var labelmarqueB: UILabel!
    @IBOutlet var labellieu: UILabel!
    @IBOutlet var labelmarqueA: UILabel!
    @IBOutlet var labelimatA: UILabel!
    @IBOutlet var labelimmatB: UILabel!
    @IBOutlet var labeldate: UILabel!
    @IBOutlet var labelprenomConductA: UILabel!
    @IBOutlet var labelprenomconductB: UILabel!
    @IBOutlet var labelnomConducB: UILabel!
  
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
