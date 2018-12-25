//
//  KeyboardUtil.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/25/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc func keyboardDone(textView:UITextView?) {
        let toolbar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 0, height: 44)))
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .done, target: textView,
                            action: #selector(resignFirstResponder))
        ]
        toolbar.barStyle = .default
        toolbar.tintColor = .darkGray
        textView?.inputAccessoryView = toolbar
    }
}
