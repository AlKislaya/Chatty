//
//  ViewController.swift
//  Chatty
//
//  Created by Alexandra on 21.10.25.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Constants.Core.appName
    }

}

