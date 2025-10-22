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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onRegisterClick(_ sender: UIButton) {
        if emailTextField == nil || emailTextField.text!.isEmpty {
            showAlert(title: "Something went wrong :((", message: "Seems like you forgot to provide your email")
            return
        }
        if passwordTextField == nil || passwordTextField.text!.isEmpty {
            showAlert(title: "Something went wrong :((", message: "Seems like you forgot to provide your password")
            return
        }
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
            if let safeArror = error {
                self.showAlert(title: "Something went wrong :((", message: safeArror.localizedDescription)
                return
            }
            
            self.performSegue(withIdentifier: "registerToChat", sender: self)
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
