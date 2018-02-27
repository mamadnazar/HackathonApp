//
//  FeedTableViewCell.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 2/28/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class FeedTableViewCell: SimpleFeedTableViewCell {
	@IBOutlet weak var imgView: UIImageView!

	var news: News? {
		didSet {
			if let news = self.news {
				if let url = URL(string: news.image_url ) {
					self.imgView.kf.setImage(with: url)
				}
				setupNews(news)
				return
			}
		}
	}
	
	var aboutHackModel: AboutHack? {
		didSet {
			if let aboutHackModel = self.aboutHackModel {
				if let url = URL(string: aboutHackModel.image_url ) {
					self.imgView.kf.setImage(with: url)
				}
				setupAboutHack(aboutHackModel)
			}
		}
	}
	
	var lifeHackModel: Lifehack? {
		didSet {
			if let lifeHackModel = self.lifeHackModel {
				if let url = URL(string: lifeHackModel.image_url ) {
					self.imgView.kf.setImage(with: url)
				}
				setupLifeHacks(lifeHackModel)
			}
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
