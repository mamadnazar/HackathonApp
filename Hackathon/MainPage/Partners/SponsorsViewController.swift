//
//  SponsorsViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class SponsorsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   
    let sponsorsType = ["Sponsors", "Partners", "Organizers"]
    let partnersSponsors = [["ArabMoney", "Rakuten"], ["Fly Emirates", "AIG", "Yokohama", "Shoro", "Nashe"], ["Neobis", "MadDevs"]]
    
    @IBOutlet weak var sponsorsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Спонсоры"
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return partnersSponsors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partnersSponsors[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sponsorsCollectionViewCellID", for: indexPath) as! SponsorsCollectionViewCell
        cell.sponsorsLabel.text = partnersSponsors[indexPath.section][indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! SponsorsCollectionReusableView
        headerView.sponsorsHeaderLabel.text = sponsorsType[indexPath.section]
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let cellWidth = (width - 40) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}
