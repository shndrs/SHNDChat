//
//  ViewController.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/24/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

class ViewController: ChatVCWithTableView {
    
    fileprivate static let cellId = "id"
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    private let messages = [
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
        navigationController?.navigationBar.backgroundColor = UIColor.init(white: 0.65, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        initTableView()
    }
    
    @IBAction private func sendButtonPressed(_ sender: UIButton) {
        messageTextView.text = ""
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func initTableView() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(MessageCell.self, forCellReuseIdentifier: ViewController.cellId)
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessageInSection = messages[section].first {
            let label = DateHeaderLabel()
            label.backgroundColor = UIColor(red: 255.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 0.90)
            label.text = SHNDDateFormatter(builder: SimpleDateBuilder(dateString: "\(firstMessageInSection.date)")).create()
            
            label.textColor = .white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false // enable auto layout
            label.font = UIFont.boldSystemFont(ofSize: 14)
            
            let containerView = UIView()
            
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellId, for: indexPath) as? MessageCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.message = messages[indexPath.section][indexPath.row]
        return cell
    }
}
