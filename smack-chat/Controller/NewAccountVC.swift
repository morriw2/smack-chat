//
//  NewAccountVC.swift
//  smack-chat
//
//  Created by Billy Morris on 9/3/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class NewAccountVC: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let userName = userNameField.text, userNameField.text != "" else {return}
        guard let email = emailField.text, emailField.text != "" else {return}
        guard let password = passwordField.text, passwordField.text != "" else {return}
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: userName, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
}
