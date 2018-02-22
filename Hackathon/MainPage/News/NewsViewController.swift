//
//  NewsViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/13/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var newses = Newses()
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        ServerManager.shared.getNewses(getNewses, error: showErrorAlert)
        newsTableView.tableFooterView = UIView()
        newsTableView.rowHeight = UITableViewAutomaticDimension
        newsTableView.estimatedRowHeight = 150
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Новости и объявления"
    }

    func getNewses(newses: Newses) {
        self.newses = newses
        self.newsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(newses.array.count)
        return newses.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsTableViewCell") as! NewsTableViewCell
        //let url = URL(string: newses.array[indexPath.item].image_url)
       // cell.newsImage.kf.setImage(with: url)
//        cell.newsImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (image, erro, type, url) in
//            guard let image = image else {return }
//            let imageWidth = image.size.width
//            let imageHeight = image.size.height
//            if imageWidth > imageHeight {
//                cell.newsImage.contentMode = .scaleAspectFit
//            } else {
//                cell.newsImage.contentMode = .scaleAspectFill
//            }
//
//         }
        cell.newsTitle.text = newses.array[indexPath.item].title
        cell.newsDateLabel.text = newses.array[indexPath.item].updated_at
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "aNewsVC") as! ANewsViewController
        vc.newsImage = newses.array[indexPath.item].image_url
        vc.newsTitle = newses.array[indexPath.item].title
        vc.newsDescription = newses.array[indexPath.item].body
        self.navigationController?.show(vc, sender: self)
    }
    
}
