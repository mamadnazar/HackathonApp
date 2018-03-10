//
//  TeamTableViewCell.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 3/10/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
	@IBOutlet weak var lblProjectName: UILabel!
	@IBOutlet weak var lblTeamName: UILabel!
	@IBOutlet weak var lblRoom: UILabel!
	
	var team = Team()
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
    }
	
	func setData(_ data: Team) {
		team = data
		lblProjectName.text = team.project_name
		lblTeamName.text = team.name
		lblRoom.text = team.room
	}

}
