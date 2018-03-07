//
//  ScheduleBarCollectionViewCell.swift
//  Hackathon
//
//  Created by Khasanza on 3/7/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ScheduleBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scheduleBarLabel: UILabel!
    
    
    override var isHighlighted: Bool {
        didSet {
            scheduleBarLabel.textColor = isHighlighted ? Style.Color.yellow : UIColor.lightGray
        }
    }
    override var isSelected: Bool {
        didSet {
            scheduleBarLabel.textColor = isSelected ? Style.Color.yellow : UIColor.lightGray
        }
    }
}
