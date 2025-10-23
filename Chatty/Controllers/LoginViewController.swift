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
    let alertController = AlertController()
    
    @IBAction func onLoginPressed(_ sender: UIButton) {
        if emailTextField == nil || emailTextField.text!.isEmpty {
            alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.emailNotProvided, sender: self)
            return
        }
        if passwordTextField == nil || passwordTextField.text!.isEmpty {
            alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.passwordNotProvided, sender: self)
            return
        }
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let safeArror = error {
                strongSelf.alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: safeArror.localizedDescription, sender: strongSelf)
                return
            }
            
            strongSelf.performSegue(withIdentifier: Constants.Segues.loginToChat, sender: self)
        }
    }
}
