//
//  MentorsCollectionViewCell.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class MentorsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mentorsImage: UIImageView!
    @IBOutlet weak var mentorsImageHeight: NSLayoutConstraint!
    @IBOutlet weak var mentorsNameLabel: UILabel!
    @IBOutlet weak var mentorsWorkareaLabel: UILabel!
    
    override func awakeFromNib() {
        let cellWidth = (UIScreen.main.bounds.width - 40) / 3
        let labelHeight = mentorsNameLabel.frame.height + mentorsWorkareaLabel.frame.height + 7.5
        mentorsImageHeight.constant = cellWidth - labelHeight
        mentorsImage.layer.masksToBounds = true
        mentorsImage.layer.cornerRadius = (cellWidth - labelHeight) / 2
        print("cellwidth-labelheight", (cellWidth - labelHeight))
    }
}
