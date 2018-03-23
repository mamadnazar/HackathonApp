//
//  MentorTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 3/23/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation
import Kingfisher

class MentorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.masksToBounds = true
            avatarImageView.layer.cornerRadius = 100
            avatarImageView.layer.borderWidth = 2
            avatarImageView.layer.borderColor = UIColor.yellow.cgColor
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var workAreaLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setValues(mentor: Mentor) {
        let url = URL(string: mentor.image_url)
        self.avatarImageView.kf.setImage(with: url)
        
        self.nameLabel.text = mentor.full_name
        self.workAreaLabel.text = mentor.work_area
        self.descriptionLabel.text = mentor.description
    }
}
