//
//  SimpleFeedTableViewCell.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 2/28/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class SimpleFeedTableViewCell: UITableViewCell {
	@IBOutlet weak var lblTitle: UILabel!
	@IBOutlet weak var lblDescription: UILabel!
	@IBOutlet weak var lblDate: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	func setupNews(_ news: News) {
		self.lblTitle.text = news.title
		self.lblDescription.text = news.body
		self.lblDate.text = news.updated_at
	}
	
	func setupAboutHack(_ aboutHackModel: AboutHack) {
		self.lblTitle.text = aboutHackModel.title
		self.lblDescription.text = aboutHackModel.description
		self.lblDate.text = ""
	}
}
