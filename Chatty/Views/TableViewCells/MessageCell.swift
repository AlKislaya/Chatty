//
//  MessageCell.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var companionAvatar: UIImageView!
    @IBOutlet weak var viewBubble: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBubble.layer.cornerRadius = viewBubble.frame.size.height / 2
    }
    
    func setRole(isCompanion: Bool) {
        userAvatar.isHidden = isCompanion
        companionAvatar.isHidden = !isCompanion
        
        viewBubble.backgroundColor = UIColor(named: isCompanion ? Constants.BrandColors.lightGreen : Constants.BrandColors.darkGreen)
    }
}
