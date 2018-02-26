//
//  RulesTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class RulesTableViewCell: UITableViewCell {

    @IBOutlet weak var rulesTitleLabel: UILabel!
    @IBOutlet weak var rulesDescriptionLabel: UILabel!
    @IBOutlet weak var rulesLinkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
