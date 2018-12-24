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
    
    let messages = [
        Message(text:"Hey dude, whats up?", isIncoming:true),
        Message(text:"Sahand maybe be beside the Rusty Cooley in his upcomming show", isIncoming:true),
        Message(text:"i'm fine \nAre you serious?!", isIncoming:false),
        Message(text:"yeps", isIncoming:true),
        Message(text:"And Michael Angelo Batio will be there for sure, is more than honor and pleasure to see such an amazing talent and hero in there", isIncoming:true),
        Message(text:"oh my God thats AWESOME, those guys are my heros", isIncoming:false),
        Message(text:"Make sure you'll be there ;-)", isIncoming:true),
        Message(text:"Dude!! I'll be there", isIncoming:false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "SHNDChat"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(MessageCell.self, forCellReuseIdentifier: ViewController.cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as? MessageCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.message = messages[indexPath.row]
        return cell
    }
}

