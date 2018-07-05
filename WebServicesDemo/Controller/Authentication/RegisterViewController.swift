//
//  RegisterViewController.swift
//  WebServicesDemo
//
//  Created by Mohamed Kelany on 6/30/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func register(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmed, !name.isEmpty,
            let email = emailTextField.text?.trimmed, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let passwordConfirm = passwordConfirmTextField.text, !passwordConfirm.isEmpty else {
                return
        }
        
        guard password == passwordConfirm else {
            return
        }
        
        API.register(name: name, email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                print("Register success || welcome to our small app :)")
            }
            
        }
    }
    
}
