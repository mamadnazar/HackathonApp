//
//  AboutHackTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class AboutHackTableViewCell: UITableViewCell {

    
    @IBOutlet weak var aboutHackImage: UIImageView!
    @IBOutlet weak var aboutHackTitleLabel: UILabel!
    @IBOutlet weak var aboutHackDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
