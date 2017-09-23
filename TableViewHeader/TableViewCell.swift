//
//  TableViewCell.swift
//  TableViewHeader
//
//  Created by Natalia Macambira on 15/04/17.
//  Copyright © 2017 Natalia Macambira. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {    
    
    @IBOutlet weak var photoImageView: UIImageView!    
    @IBOutlet weak var descriptionLabel: UILabel!    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
}
