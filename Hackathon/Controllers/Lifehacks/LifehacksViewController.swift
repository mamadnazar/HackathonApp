//
//  LifehacksViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class LifehacksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
    @IBOutlet weak var tableView: UITableView!
	
    var lifehacks = Lifehacks()
	let cellId = "FeedTableViewCell"
	let noImageCellId = "SimpleFeedTableViewCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setup()
        ServerManager.shared.getLifehacks(setData, error: showErrorAlert)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.faq
    }
	
	func setup() {
		self.setNavigationBar()
		tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 110
		tableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
		tableView.register(UINib.init(nibName: noImageCellId, bundle: nil), forCellReuseIdentifier: noImageCellId)
	}

    func setData(lifehacks: Lifehacks) {
        self.lifehacks = lifehacks
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifehacks.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let lifehack = lifehacks.array[indexPath.item]
		
		if lifehack.image_url.isEmpty {
			let cell = tableView.dequeueReusableCell(withIdentifier: noImageCellId) as! SimpleFeedTableViewCell
			cell.setupLifeHacks(lifehack)
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! FeedTableViewCell
		cell.lifeHackModel = lifehack
		return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "DetailedInfoViewController") as! DetailedInfoViewController
		let model = lifehacks.array[indexPath.item]
		vc._title = model.title
		vc._description = model.description
		vc.imageUrl = model.image_url
		vc.link = model.link
		self.navigationController?.show(vc, sender: self)
    }
    
    
}
