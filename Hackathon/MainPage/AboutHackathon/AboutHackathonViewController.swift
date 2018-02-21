//
//  AboutHackathonViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class AboutHackathonViewController: UIViewController {

    @IBOutlet weak var aboutHackathonDescriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        showErrorAlert(message: "ne spi")
        ServerManager.shared.getAboutHack(setAboutHack, error: showErrorAlert)
        
    }
    
    func setAboutHack(aboutHack: AboutHack) {
        aboutHackathonDescriptionLbl.text = aboutHack.title
        print(aboutHack)
        
    }
}
