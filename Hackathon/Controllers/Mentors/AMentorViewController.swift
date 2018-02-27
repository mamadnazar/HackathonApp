//
//  AMentorViewController.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/23/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class AMentorViewController: UIViewController {

    
    @IBOutlet weak var aMentorImage: UIImageView! {
        didSet {
            aMentorImage.layer.cornerRadius = aMentorImage.frame.size.height / 2.0
           // aMentorImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var aMentorWorkareaLabel: UILabel!
    @IBOutlet weak var aMentorNameLabel: UILabel! {
        didSet {
            aMentorNameLabel.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        }
    }
    @IBOutlet weak var aMentorDescriptionLabel: UILabel!
    var mentorID: Int?
    var mentor_image: String?
    var mentor_workarea: String?
    var mentor_name: String?
    var mentor_description: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServerManager.shared.getMentorByID(mentorID: mentorID!, setMentor, error: showErrorAlert)
        self.aMentorNameLabel.text = mentor_name
        self.aMentorWorkareaLabel.text = mentor_workarea
        let url = URL(string: mentor_image!)
        self.aMentorImage.kf.setImage(with: url, placeholder: UIImage(named: "ril"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    func setMentor(mentor: Mentor) {
        self.aMentorDescriptionLabel.text = mentor.description
    }
    
}
