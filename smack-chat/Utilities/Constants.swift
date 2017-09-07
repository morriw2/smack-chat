//
//  Constants.swift
//  smack-chat
//
//  Created by Billy Morris on 9/3/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import Foundation

//Segues

let TO_LOGIN = "toLoginVC"
let TO_NEW_ACCOUNT = "toNewAccountVC"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL

let BASE_URL = "https://smackchatchatchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"

//Colors

let smackColorPurple = #colorLiteral(red: 0.2588235294, green: 0.3294117647, blue: 0.7254901961, alpha: 0.5)

//Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
















