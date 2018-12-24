//
//  MessageCell.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/24/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    private let messageLabel = UILabel()
    private let messageBackGroundView = UIView()
    
    private var leadingConstraint:NSLayoutConstraint!
    private var trailingConstraint:NSLayoutConstraint!
    
    public var message: Message {
        didSet {
            messageBackGroundView.backgroundColor = message.isIncoming ? .darkGray : .white
            messageLabel.textColor = message.isIncoming ? .white : .black
            messageLabel.text = message.text
            
            if message.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.message = Message(text: "", isIncoming: true)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        messageBackGroundView.translatesAutoresizingMaskIntoConstraints = false
        messageBackGroundView.layer.cornerRadius = 8.0
        addSubview(messageBackGroundView)
        addSubview(messageLabel)
        
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false 
        
        let constraints = [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            messageBackGroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
            messageBackGroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
            messageBackGroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
            messageBackGroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        leadingConstraint.isActive = false
        
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        trailingConstraint.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
