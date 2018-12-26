//
//  ChatVCWithTableView.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/25/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

class ChatVCWithTableView: UIViewController {
    
    @IBOutlet weak var messageTextView:UITextView!
    @IBOutlet weak var messageTextViewHeight:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateConstrants(animationPerformedOnce: false)
        messageTextView.addObserver(self, forKeyPath: "contentSize", options:  NSKeyValueObservingOptions.new, context: nil)
        messageTextView.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 0.7).cgColor
        messageTextView.layer.borderWidth = 1.0
        messageTextView.layer.cornerRadius = 15
        
        addKeyboardObserverSetUp()
    }
    
    func addKeyboardObserverSetUp() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, forKeyPath: "contentSize", context: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        updateConstrants(animationPerformedOnce: true)
    }
    
    func updateConstrants(animationPerformedOnce:Bool) {
        
        if messageTextView.contentSize.height < 150 {
            if animationPerformedOnce {
                messageTextView.layer.removeAllAnimations()
                messageTextViewHeight.constant = messageTextView.contentSize.height
                UIView.animate(withDuration: 0.3) {
                    self.view.updateConstraints()
                    self.view.layoutIfNeeded()
                }
            } else {
                messageTextViewHeight.constant = messageTextView.contentSize.height
                view.updateConstraints()
                view.layoutIfNeeded()
            }
        }
    }
}

extension ChatVCWithTableView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        messageTextView.resignFirstResponder()
    }
}
