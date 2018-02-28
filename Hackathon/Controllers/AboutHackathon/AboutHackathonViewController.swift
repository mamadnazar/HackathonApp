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
	
    @IBOutlet weak var tableView: UITableView!
	var aboutHacks = AboutHacks()
	
	let cellId = "FeedTableViewCell"
	let noImageCellId = "SimpleFeedTableViewCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getAboutHacks(setAboutHacks, error: showErrorAlert)
		setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.aboutHack
    }
	
	func setup() {
		tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
		tableView.register(UINib(nibName: noImageCellId, bundle: nil), forCellReuseIdentifier: noImageCellId)
		tableView.tableFooterView = UIView()
		setNavigationBar()
	}
	
    func setAboutHacks(aboutHacks: AboutHacks) {
        self.aboutHacks = aboutHacks
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutHacks.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if aboutHacks.array[indexPath.item].image_url.isEmpty {
			let cell = tableView.dequeueReusableCell(withIdentifier: noImageCellId) as! SimpleFeedTableViewCell
			cell.setupAboutHack(aboutHacks.array[indexPath.item])
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedTableViewCell
		cell.aboutHackModel = aboutHacks.array[indexPath.item]
		return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "DetailedInfoViewController") as! DetailedInfoViewController
		let model = aboutHacks.array[indexPath.item]
		vc._title = model.title
		vc._description = model.description
		vc.imageUrl = model.image_url
		vc.link = model.link
		self.navigationController?.show(vc, sender: self)
    }
    
}
