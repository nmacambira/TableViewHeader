//
//  TableViewHeader.swift
//  TableViewHeader
//
//  Created by Natalia Macambira on 15/04/17.
//  Copyright © 2017 Natalia Macambira. All rights reserved.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
        self.imageView.clipsToBounds = true
    
    }

}
