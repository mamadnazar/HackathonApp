//
//  SponsorsViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class SponsorsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var sponsorTypes = SponsorTypes()
    
    @IBOutlet weak var sponsorsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        ServerManager.shared.getSponsors(getSponsors, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Спонсоры"
    }

    func getSponsors(sponsorTypes: SponsorTypes) {
        self.sponsorTypes = sponsorTypes
        self.sponsorsCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sponsorTypes.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sponsorTypes.array[section].items.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sponsorsCollectionViewCellID", for: indexPath) as! SponsorsCollectionViewCell
        let url = URL(string: sponsorTypes.array[indexPath.section].items.array[indexPath.item].logo_url)
        cell.sponsorsImageView.kf.setImage(with: url)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerID", for: indexPath) as! SponsorsCollectionReusableView
        headerView.sponsorsHeaderLabel.text = sponsorTypes.array[indexPath.section].type
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let cellWidth = (width - 40) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
}
