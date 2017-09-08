//
//  SocketService.swift
//  smack-chat
//
//  Created by Billy Morris on 9/7/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, description: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, description)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDes = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDes, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    

}

















