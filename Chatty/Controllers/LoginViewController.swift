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
            alertController.showDefaultAlert(title: "Something went wrong :((", message: "Seems like you forgot to provide your email", sender: self)
            return
        }
        if passwordTextField == nil || passwordTextField.text!.isEmpty {
            alertController.showDefaultAlert(title: "Something went wrong :((", message: "Seems like you forgot to provide your password", sender: self)
            return
        }
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let safeArror = error {
                strongSelf.alertController.showDefaultAlert(title: "Something went wrong :((", message: safeArror.localizedDescription, sender: strongSelf)
                return
            }
            
            strongSelf.performSegue(withIdentifier: "loginToChat", sender: self)
        }
    }
}
