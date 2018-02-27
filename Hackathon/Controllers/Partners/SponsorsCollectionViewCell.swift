//
//  SponsorsCollectionViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class SponsorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sponsorsImageView: UIImageView!
 
    override func awakeFromNib() {
        sponsorsImageView.layer.borderColor = UIColor.init(red: 220, green: 220, blue: 220).cgColor
        sponsorsImageView.layer.borderWidth = 0.5
    }
}
