//
//  ChatViewController.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    let alertController = AlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Core.appName
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func onLogOutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            alertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: signOutError.localizedDescription, sender: self)
        }
    }
}
