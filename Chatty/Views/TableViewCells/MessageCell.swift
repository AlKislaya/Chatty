//
//  MessageCell.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var viewBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBubble.layer.cornerRadius = viewBubble.frame.size.height / 2
    }
}
