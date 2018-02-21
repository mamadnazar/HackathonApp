//
//  SponsorsCollectionReusableView.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class SponsorsCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var sponsorsHeaderLabel: UILabel! {
        didSet {
            sponsorsHeaderLabel.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        }
    }
}
