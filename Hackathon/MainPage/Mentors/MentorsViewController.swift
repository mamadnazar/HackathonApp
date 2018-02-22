//
//  MentorsViewController.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/22/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class MentorsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var mentorsCollectionView: UICollectionView!
    var mentorTypes = MentorTypes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        ServerManager.shared.getMentors(getMentors, error: showErrorAlert)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = "Менторы и жюри"
    }

    func getMentors(mentorTypes: MentorTypes) {
        self.mentorTypes = mentorTypes
        self.mentorsCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mentorTypes.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mentorTypes.array[section].items.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mentorsCollectionViewCellID", for: indexPath) as! MentorsCollectionViewCell
        let url = URL(string: mentorTypes.array[indexPath.section].items.array[indexPath.item].image_url)
        cell.mentorsImage.kf.setImage(with: url)
        cell.mentorsNameLabel.text = mentorTypes.array[indexPath.section].items.array[indexPath.item].full_name
        cell.mentorsWorkareaLabel.text = mentorTypes.array[indexPath.section].items.array[indexPath.item].work_place
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let cellWidth = (width - 40) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "mentorsHeaderID", for: indexPath) as! MentorsCollectionReusableView
        headerView.mentorsHeaderLabel.text = mentorTypes.array[indexPath.section].type
        return headerView
    }
}
