//
//  MentorsCollectionReusableView.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class MentorsCollectionReusableView: UICollectionReusableView {
            
    @IBOutlet weak var mentorsHeaderLabel: UILabel! {
        didSet {
            mentorsHeaderLabel.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        }
    }
    
}
