//
//  AlertController.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

import UIKit

class AlertController {
    static func showDefaultAlert(title: String, message: String, sender: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(Constants.Core.ok, comment: Constants.Core.ok), style: .default, handler: { _ in
                alert.dismiss(animated: true)
            }))
        sender.present(alert, animated: true, completion: nil)
    }
}
