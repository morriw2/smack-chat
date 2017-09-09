//
//  ChatVC.swift
//  smack-chat
//
//  Created by Billy Morris on 8/31/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    var isTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.isHidden = true
        view.bindToKeyboard()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.estimatedRowHeight = 80
        messageTableView.rowHeight = UITableViewAutomaticDimension
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
        menuButton.addTarget(self.revealViewController, action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        SocketService.instance.getChatMessage { (success) in
            if success {
                self.messageTableView.reloadData()
            }
        }
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channelNameLabel.text = "Please Login"
            self.messageTableView.reloadData()
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLabel.text = "#\(channelName)"
        getMessages()
    }
    
    func onLoginGetMessages() {
        MessageService.instance.findAllChannels { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLabel.text = "No channels yet"
                }
            }
        }
    }
    
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel?.id else {return}
        MessageService.instance.findAllMessagesForChannel(channelId: channelId) { (success) in
            if success {
                self.messageTableView.reloadData()
                if MessageService.instance.messages.count > 0 {
                    let indIndex = IndexPath(row: MessageService.instance.messages.count - 1, section: 0)
                    self.messageTableView.scrollToRow(at: indIndex, at: .bottom, animated: false)
                }
            }
        }
    }
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelId = MessageService.instance.selectedChannel?.id else {return}
            guard let message = messageField.text else {return}
            SocketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelId, completion: { (success) in
                if success {
                    self.messageField.text = ""
                    self.messageField.resignFirstResponder()
                }
            })
        }
    }
    
    @IBAction func editing(_ sender: Any) {
        if messageField.text == "" {
            isTyping = false
            sendButton.isHidden = true
        } else {
            if isTyping == false {
                sendButton.isHidden = false
            }
            isTyping = true
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = messageTableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell {
            let message = MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
}






















