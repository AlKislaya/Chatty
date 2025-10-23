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
    let alertController = AlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onRegisterClick(_ sender: UIButton) {
        if emailTextField == nil || emailTextField.text!.isEmpty {
            alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.emailNotProvided, sender: self)
            return
        }
        if passwordTextField == nil || passwordTextField.text!.isEmpty {
            alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: Constants.Errors.passwordNotProvided, sender: self)
            return
        }
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            if let safeArror = error {
                self.alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: safeArror.localizedDescription, sender: self)
                return
            }
            
            self.performSegue(withIdentifier: Constants.Segues.registerToChat, sender: self)
        }
    }
}
