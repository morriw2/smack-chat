//
//  AddChannelVC.swift
//  smack-chat
//
//  Created by Billy Morris on 9/7/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var channelNameFiels: UITextField!
    @IBOutlet weak var channelDesField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    func setUpView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        channelNameFiels.attributedPlaceholder = NSAttributedString(string: "channel name", attributes: [NSAttributedStringKey.foregroundColor:smackColorPurple])
        channelDesField.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor:smackColorPurple])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = channelNameFiels.text, channelNameFiels.text != "" else {return}
        guard let description = channelDesField.text else {return}
        SocketService.instance.addChannel(channelName: channelName, description: description) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    

}
