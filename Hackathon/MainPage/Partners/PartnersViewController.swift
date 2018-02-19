//
//  PartnersViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class PartnersViewController: UIViewController//, UICollectionViewDelegate, UICollectionViewDataSource
{
    
    let partnersDictionary = ["Sponsors": ["ArabMoney", "Rakuten"], "Partners": ["Fly Emirates", "AIG", "Yokohama", "Shoro", "Nashe"], "Organizers": ["Neobis", "MadDevs"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableCell(withReuseIdentifier: "partnersHeaderView", for: indexPath)
        return headerView
    }
    
}
