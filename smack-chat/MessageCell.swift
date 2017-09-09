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
        guard var isoDate = message.timeStamp else {return}
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
        isoDate = isoDate.substring(to: end)
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timeStampLabel.text = finalDate
        }
    }

}
