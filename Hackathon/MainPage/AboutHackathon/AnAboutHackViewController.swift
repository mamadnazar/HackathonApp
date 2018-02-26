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
    @IBOutlet weak var anAboutHackDescription: UILabel!
    @IBOutlet weak var anAboutHackLink: UITextView!
    
    var abouthack_image: String?
    var abouthack_title: String?
    var abouthack_description: String?
    var abouthack_link: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.anAboutHackTitleLabel.text = abouthack_title
        self.anAboutHackDescription.text = abouthack_description
        let url = URL(string: abouthack_image!)
        self.anAboutHackImage.kf.setImage(with: url)
        self.anAboutHackLink.text = abouthack_link
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
