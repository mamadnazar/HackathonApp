//
//  ContactsTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 3/23/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import Foundation

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    func setValues(contact: Contact) {
        switch contact.type {
        case "facebook":
            iconImageView.image = UIImage(named: "fb")
            typeLabel.text = "Facebook"
        case "phone":
            iconImageView.image = UIImage(named: "phone")
            typeLabel.text = "Телефон"
        case "telegram":
            iconImageView.image = UIImage(named: "telegram")
            typeLabel.text = "телеграм"
        case "instagram":
            iconImageView.image = UIImage(named: "instagram")
            typeLabel.text = "Instagram"
        case "email":
            iconImageView.image = UIImage(named: "email")
            typeLabel.text = "E-mail"
        case "github":
            iconImageView.image = UIImage(named: "git")
            typeLabel.text = "GitHub"
        case "skype":
            iconImageView.image = UIImage(named: "skype")
            typeLabel.text = "Skype"
        case "linkedin":
            iconImageView.image = UIImage(named: "linked")
            typeLabel.text = "LinkedIn"
        default:
            break
        }
        valueLabel.text = contact.value
    }
}
