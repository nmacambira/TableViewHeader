//
//  TableViewController.swift
//  TableViewHeader
//
//  Created by Natalia Macambira on 15/04/17.
//  Copyright © 2017 Natalia Macambira. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedHeader = UINib(nibName: "TableViewHeader", bundle: nil)
        self.tableView.register(feedHeader, forHeaderFooterViewReuseIdentifier: "header")
        
        let feedNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(feedNib, forCellReuseIdentifier: "cell")
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.photoImageView?.image = UIImage(named: "Image.jpg")
        cell.descriptionLabel?.text = "Just some text..."
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! TableViewHeader
        
        header.imageView.image = UIImage(named: "User.jpg")
        header.usernameLabel.text = "Natalia Macambira"
        header.contentView.backgroundColor = UIColor.white
        
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 60
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}
