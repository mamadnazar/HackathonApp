//
//  LifehacksTableViewCell.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class LifehacksTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lifeHacksView: UIView! {
        didSet {
            self.lifeHacksView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var lifeHacksTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
