//
//  ViewController.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 6/30/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        API.login(email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                //say welcome
            } else {
                //say error
            }
        }
        
       
    }
}

