//
//  RulesTableViewCell.swift
//  Hackathon
//
//  Created by Khasanza on 2/27/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class RulesTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
	var rule : Rule? {
		didSet {
			if let rule = self.rule,  lblTitle != nil {
				lblTitle.text = rule.title
				lblDescription.text = rule.description
			}
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
