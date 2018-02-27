//
//  AnAboutHackViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class AnAboutHackViewController: UIViewController {

    @IBOutlet weak var anAboutHackImage: UIImageView!
    @IBOutlet weak var anAboutHackTitleLabel: UILabel!
    @IBOutlet weak var anAboutHackDescription: UITextView!
    @IBOutlet weak var anAboutHackLink: UITextView!
	
	var aboutHackModel: AboutHack?
	
    var abouthack_image: String?
    var abouthack_title: String?
    var abouthack_description: String?
    var abouthack_link: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        self.anAboutHackTitleLabel.text = aboutHackModel?.title
        self.anAboutHackDescription.text = aboutHackModel?.description
		if let url = URL(string: (aboutHackModel?.image_url ?? "")) {
			self.anAboutHackImage.kf.setImage(with: url)
		}
        self.anAboutHackLink.text = aboutHackModel?.link
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
