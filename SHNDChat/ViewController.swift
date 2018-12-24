//
//  ViewController.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/24/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate static let cellId = "id"
    let textMessages = ["Dean produce his first guitar ar 1976",
                        "Sahand maybe be beside the Rusty Cooley in his upcomming show",
                        "And Michael Angelo Batio will be there for sure, is more than honor and pleasure to see such an amazing talent and hero in my show",
                        "Make sure you'll be there ;-)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "SHNDChat"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.register(MessageCell.self, forCellReuseIdentifier: ViewController.cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textMessages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as? MessageCell else { return UITableViewCell() }
        cell.messageLabel.text = textMessages[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        return cell
    }

}

