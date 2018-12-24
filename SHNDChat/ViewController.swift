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
    
    //2D array
    
    let messages = [
        [
            Message(text:"Hey dude, whats up?", isIncoming:true, date: Date.dateFromCustomString(dateString: "12/22/2018")),
            Message(text:"Sahand maybe be beside the Rusty Cooley in his upcomming show", isIncoming:true, date: Date.dateFromCustomString(dateString: "12/22/2018"))
        ],
        [
            Message(text:"i'm fine \nAre you serious?!", isIncoming:false, date: Date.dateFromCustomString(dateString: "12/23/2018")),
            Message(text:"yeps", isIncoming:true, date: Date.dateFromCustomString(dateString: "12/23/2018")),
            Message(text:"And Michael Angelo Batio will be there for sure, is more than honor and pleasure to see such an amazing talent and hero in there", isIncoming:true, date: Date.dateFromCustomString(dateString: "12/23/2018"))
        ],
        [
            Message(text:"oh my God thats AWESOME, those guys are my heros", isIncoming:false, date: Date.dateFromCustomString(dateString: "12/24/2018")),
            Message(text:"Make sure you'll be there ;-)", isIncoming:true, date: Date.dateFromCustomString(dateString: "12/24/2018")),
            Message(text:"Dude!! I'll be there", isIncoming:false, date: Date.dateFromCustomString(dateString: "12/24/2018"))
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "SHNDChat"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(MessageCell.self, forCellReuseIdentifier: ViewController.cellId)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        if let firstMessageInSection = messages[section].first {
            
            
            let dateString = SHNDDateFormatter(builder: SimpleDateBuilder(dateString: "\(firstMessageInSection.date)")).create()
            
            return dateString
        }
        
        return "Section: \(Date())"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as? MessageCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        cell.message = messages[indexPath.section][indexPath.row]
        return cell
    }
}

