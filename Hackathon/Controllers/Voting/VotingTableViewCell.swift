//
//  VotingTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 3/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class VotingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var projectNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
