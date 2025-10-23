//
//  LoginViewController.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onLoginPressed(_ sender: UIButton) {
        var email = emailTextField.text!
        if email.isEmpty {
            AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.emailNotProvided, sender: self)
            return
        }
        
        var password = passwordTextField.text!
        if password.isEmpty {
            AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.passwordNotProvided, sender: self)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let safeArror = error {
                AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: safeArror.localizedDescription, sender: strongSelf)
                return
            }
            
            strongSelf.performSegue(withIdentifier: Constants.Segues.loginToChat, sender: self)
        }
    }
}
