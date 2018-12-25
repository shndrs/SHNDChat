//
//  UILabelMaterial.swift
//  SHNDChat
//
//  Created by Sahand Raeisi on 12/24/18.
//  Copyright © 2018 Sahand Raeisi. All rights reserved.
//

import UIKit

public class DateHeaderLabel: UILabel {
    
    override public var intrinsicContentSize: CGSize {
        
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        
        return CGSize(width: originalContentSize.width + 16,
                      height: height)
        
    }
}
