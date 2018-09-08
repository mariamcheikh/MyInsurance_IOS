//
//  CustomConstatUserTableViewCell.swift
//  Assurance
//
//  Created by Mariam on 1/11/18.
//  Copyright © 2018 Mariam. All rights reserved.
//

import UIKit

class CustomConstatUserTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    
    @IBOutlet var labeldate: UILabel!
    
    
    @IBOutlet var labellieu: UILabel!
    
    
    @IBOutlet var labelnomconductB: UILabel!
    
    
    @IBOutlet var labelnomconductA: UILabel!
    
    @IBOutlet var labelprenomconductB: UILabel!
    
    @IBOutlet var labelImmatA: UILabel!
    @IBOutlet var labelprenomconductA: UILabel!
    @IBOutlet var labelImatB: UILabel!
    
    @IBOutlet var labelmarqueA: UILabel!
    
    @IBOutlet var labelmarqueB: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
