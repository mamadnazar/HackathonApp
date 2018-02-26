//
//  ASponsorViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class ASponsorViewController: UIViewController {
    
    @IBOutlet weak var sponsorImage: UIImageView!
    @IBOutlet weak var sponsorNameLabel: UILabel! {
        didSet {
            sponsorNameLabel.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        }
    }
    @IBOutlet weak var sponsorDescriptionLabel: UILabel!
    @IBOutlet weak var sponsorURLLabel: UITextView!
    var sponsor_image: String?
    var sponsor_name: String?
    var sponsor_description: String?
    var sponsor_url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sponsorNameLabel.text = sponsor_name
        self.sponsorDescriptionLabel.text = sponsor_description
        self.sponsorURLLabel.text = sponsor_url
        let url = URL(string: sponsor_image!)
        self.sponsorImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
    }
}
