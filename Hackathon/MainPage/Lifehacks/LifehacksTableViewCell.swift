//
//  LifehacksTableViewCell.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class LifehacksTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lifehacksTitleLbl: UILabel!
    @IBOutlet weak var lifehacksLinkLbl: UILabel!
    @IBOutlet weak var lifehacksImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
