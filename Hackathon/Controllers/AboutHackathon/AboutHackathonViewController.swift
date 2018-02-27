//
//  AboutHackathonViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class AboutHackathonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var aboutHacks = AboutHacks()
    @IBOutlet weak var aboutHackTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutHackTableView.tableFooterView = UIView()
        setNavigationBar()
        ServerManager.shared.getAboutHacks(getAboutHacks, error: showErrorAlert)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "О хакатоне"
    }
    
    func getAboutHacks(aboutHacks: AboutHacks) {
        self.aboutHacks = aboutHacks
        self.aboutHackTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutHacks.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutHackCellID") as! AboutHackTableViewCell
       cell.aboutHackModel = aboutHacks.array[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "anAboutHackVC") as! AnAboutHackViewController
		vc.aboutHackModel = aboutHacks.array[indexPath.item]
        self.navigationController?.show(vc, sender: self)
    }
    
}
