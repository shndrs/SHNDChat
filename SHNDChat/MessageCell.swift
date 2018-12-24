//
//  MessageCell.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/24/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let messageBackGroundView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        messageBackGroundView.backgroundColor = .lightGray
        messageBackGroundView.translatesAutoresizingMaskIntoConstraints = false
        messageBackGroundView.layer.cornerRadius = 5.0
        addSubview(messageBackGroundView)
        addSubview(messageLabel)
        
        //messageLabel.backgroundColor = .lightGray
//        messageLabel.text = "Dean Rusty Cooley RC7 is an awsome guitar, that thin body and tilted neck pickup is just super awesome, hope you enjoy playing it someday if you don't already have one"
        messageLabel.numberOfLines = 0
        //"What da fuck i going on with iOS 12.1 !? seriously?!!"
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false 
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            messageLabel.widthAnchor.constraint(equalToConstant: 250),
            messageBackGroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -4),
            messageBackGroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -4),
            messageBackGroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 4),
            messageBackGroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 4)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
