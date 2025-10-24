//
//  RegisterViewController.swift
//  Chatty
//
//  Created by Alexandra on 22.10.25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onRegisterClick(_ sender: UIButton) {
        let email = emailTextField.text!
        if email.isEmpty {
            AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.emailNotProvided, sender: self)
            return
        }
        
        let password = passwordTextField.text!
        if password.isEmpty {
            AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.passwordNotProvided, sender: self)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let safeArror = error {
                AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: safeArror.localizedDescription, sender: self)
                return
            }
            
            self.performSegue(withIdentifier: Constants.Segues.registerToChat, sender: self)
        }
    }
}
