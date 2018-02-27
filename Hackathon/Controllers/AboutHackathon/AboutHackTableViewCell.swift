//
//  AboutHackTableViewCell.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class AboutHackTableViewCell: UITableViewCell {

    
    @IBOutlet weak var aboutHackImage: UIImageView!
    @IBOutlet weak var aboutHackTitleLabel: UILabel!
    @IBOutlet weak var aboutHackDescriptionLabel: UILabel!
	var aboutHackModel: AboutHack? {
		didSet {
			if let url = URL(string: aboutHackModel?.image_url ?? "") {
				self.aboutHackImage.kf.setImage(with: url)
			}
			self.aboutHackTitleLabel.text = aboutHackModel?.title ?? ""
			self.aboutHackDescriptionLabel.text = aboutHackModel?.description ?? ""
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
