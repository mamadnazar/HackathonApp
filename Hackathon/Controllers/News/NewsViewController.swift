//
//  NewsViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/13/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var newsTableView: UITableView!
	
	var newses = Newses()
	let cellId = "FeedTableViewCell"
	let noImageCellId = "SimpleFeedTableViewCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setup()
        ServerManager.shared.getNewses(setNewsFeed, error: showErrorAlert)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Новости и объявления"
    }
	
	func setup() {
		self.setNavigationBar()
		newsTableView.tableFooterView = UIView()
		newsTableView.rowHeight = UITableViewAutomaticDimension
		newsTableView.estimatedRowHeight = 150
		newsTableView.register(UINib.init(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
		newsTableView.register(UINib.init(nibName: noImageCellId, bundle: nil), forCellReuseIdentifier: noImageCellId)
	}

    func setNewsFeed(newses: Newses) {
        self.newses = newses
        self.newsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newses.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if newses.array[indexPath.item].image_url.isEmpty {
			let cell = newsTableView.dequeueReusableCell(withIdentifier: noImageCellId) as! SimpleFeedTableViewCell
			cell.setupNews(newses.array[indexPath.item])
			return cell
		}
        let cell = newsTableView.dequeueReusableCell(withIdentifier: cellId) as! FeedTableViewCell
		cell.news = newses.array[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailedInfoViewController") as! DetailedInfoViewController
		let model = newses.array[indexPath.item]
		vc._title = model.title
		vc._description = model.body
		vc.imageUrl = model.image_url
		vc.date = model.updated_at
        self.navigationController?.show(vc, sender: self)
        
    }
    
}
