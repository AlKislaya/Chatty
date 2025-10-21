//
//  ViewController.swift
//  Chatty
//
//  Created by Alexandra on 21.10.25.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLabel(with: titleLable, timeInterval: 0.15)
    }
    
    func animateLabel(with label: UILabel, timeInterval interval: Double) {
        if label.text == nil {
            return
        }
        
        let temp = label.text!
        if temp.isEmpty {
            return
        }
        
        label.text = ""
        var timerInterval: Double = 0
        
        for char in temp {
            timerInterval += interval
            Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: false) { Timer in
                self.titleLable.text?.append(char)
            }
        }
    }
}

