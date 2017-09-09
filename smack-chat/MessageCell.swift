//
//  MessageCell.swift
//  smack-chat
//
//  Created by Billy Morris on 9/8/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var profileImage: CircleImage!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(message: Message) {
        messageLabel.text = message.message
        userNameLabel.text = message.userName
        profileImage.image = UIImage(named: message.userAvatar)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }

}
