//
//  ExpandableCellsTableViewController.swift
//  TableViewHeader
//
//  Created by Natalia Macambira on 23/09/17.
//  Copyright © 2017 Natalia Macambira. All rights reserved.
//

import UIKit

final class ExpandableCellsTableViewController: UITableViewController {
    
    private let numberOfRowsPerSection = [5, 4, 2, 0, 1, 5, 8, 2, 4, 5]
    private var selectedSection = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        let feedHeader = UINib(nibName: "TableViewHeader", bundle: nil)
        tableView.register(feedHeader, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfRowsPerSection.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == selectedSection {
            return numberOfRowsPerSection[section]
        } else {
            return 0
        }
    }    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! TableViewHeader
        header.imageView.image = UIImage(named: "User.jpg")
        header.usernameLabel.text = "Natalia Macambira - Section \(section)"
        
        header.button.addTarget(self, action: #selector(headerTapped(_:)), for: .touchUpInside)
        header.button.section = section
        
        header.contentView.backgroundColor = .white
        if section == selectedSection {
            header.contentView.backgroundColor = UIColor(red: 76/255, green: 161/255, blue: 253/255, alpha: 0.8)
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func headerTapped(_ sender: HeaderButton) {
        let section = sender.section
        //print("Header section:", section)
        let lastSelectedSection = selectedSection
        
        if selectedSection == section {
            selectedSection = -1
        } else {
            selectedSection = section
        }
        
        if lastSelectedSection == -1 || selectedSection == -1 {
            tableView.reloadSections([section], with: .automatic)
        } else {
            tableView.reloadSections([lastSelectedSection, selectedSection], with: .automatic)
        }
        
        let numberOfRows = selectedSection == -1 ? 0 : numberOfRowsPerSection[selectedSection]
        if numberOfRows != 0 {
            let indexPath = IndexPath(row: 0, section: section)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
}
