//
//  TeamMemberTableViewCell.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/10/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class TeamMemberTableViewCell: UITableViewCell {

	@IBOutlet weak var lblName: UILabel!
	@IBOutlet weak var lblType: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func setData(_ data: Member) {
		lblName.text = data.full_name ?? ""
		lblType.text = data.type ?? ""
	}
	//memberCell

}
