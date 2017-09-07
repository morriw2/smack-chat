//
//  CircleImage.swift
//  smack-chat
//
//  Created by Billy Morris on 9/5/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

@IBDesignable

class CircleImage: UIImageView {

    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setUpView()
    }
    

}
