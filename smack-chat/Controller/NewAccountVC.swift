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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailField.text, emailField.text != "" else {return}
        guard let password = passwordField.text, passwordField.text != "" else {return}
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("logged in user", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
}
