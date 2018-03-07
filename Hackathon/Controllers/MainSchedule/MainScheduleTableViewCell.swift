//
//  MainScheduleTableViewCell.swift
//  Hackathon
//
//  Created by Khasanza on 3/7/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class MainScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var scheduleDateLabel: UILabel!
    @IBOutlet weak var scheduleTitleLabel: UILabel!
    @IBOutlet weak var scheduleLocationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
