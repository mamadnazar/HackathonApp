//
//  SponsorsCollectionViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class SponsorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sponsorsLabel: UILabel!
    @IBOutlet weak var sponsorsImageView: UIImageView!
    {
        didSet {
            //sponsorsImageView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    override func awakeFromNib() {
//        let height = ((UIScreen.main.bounds.width - 30) / 3) - sponsorsLabel.frame.height
//        sponsorsImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
//        sponsorsImageView.widthAnchor.constraint(equalTo: sponsorsImageView.heightAnchor, multiplier: 1).isActive = true
    }
}
