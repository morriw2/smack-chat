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


//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL

let BASE_URL = "https://smackchatchatchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
