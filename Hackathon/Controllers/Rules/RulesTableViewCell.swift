//
//  RulesTableViewCell.swift
//  Hackathon
//
//  Created by Khasanza on 2/27/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class RulesTableViewCell: UITableViewCell {

    @IBOutlet weak var rulesTableViewTitle: UILabel!
    @IBOutlet weak var rulesTableViewDescription: UILabel!
    @IBOutlet weak var rulesTableViewLink: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
