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
        let url = URL(string: aboutHacks.array[indexPath.item].image_url)
        print(aboutHacks.array[indexPath.item].image_url)
        cell.aboutHackImage.kf.setImage(with: url)
        cell.aboutHackTitleLabel.text = aboutHacks.array[indexPath.item].title
        cell.aboutHackDescriptionLabel.text = aboutHacks.array[indexPath.item].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 0.7)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "anAboutHackVC") as! AnAboutHackViewController
		
        vc.abouthack_image = aboutHacks.array[indexPath.item].image_url
        vc.abouthack_title = aboutHacks.array[indexPath.item].title
        vc.abouthack_description = aboutHacks.array[indexPath.item].description
        vc.abouthack_link = aboutHacks.array[indexPath.item].link
        self.navigationController?.show(vc, sender: self)
    }
    
}
