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
        mentorsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        ServerManager.shared.getMentors(getMentors, error: showErrorAlert)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = Constants.mentors
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
        cell.mentorsNameLabel.text = mentorTypes.array[indexPath.section].items.array[indexPath.item].full_name
        cell.mentorsWorkareaLabel.text = mentorTypes.array[indexPath.section].items.array[indexPath.item].work_place
        cell.mentorsImage.kf.setImage(with: url, placeholder: UIImage(named: "no_photo"), options: nil, progressBlock: nil, completionHandler: nil)
        print("mentorsviewcontroller", cell.mentorsImage.frame.height)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.bounds.width
        let cellWidth = (width - 40 - 10) / 3
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "mentorsHeaderID", for: indexPath) as! MentorsCollectionReusableView
        headerView.mentorsHeaderLabel.text = mentorTypes.array[indexPath.section].type
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "mentorVC") as! MentorDetailedViewController
        vc.mentorId = mentorTypes.array[indexPath.section].items.array[indexPath.row].id
//        vc.mentor_name = mentorTypes.array[indexPath.section].items.array[indexPath.item].full_name
//        vc.mentor_workarea = mentorTypes.array[indexPath.section].items.array[indexPath.item].work_area + " " + mentorTypes.array[indexPath.section].items.array[indexPath.item].work_place
//        vc.mentor_image = mentorTypes.array[indexPath.section].items.array[indexPath.item].image_url
        //vc.mentor_description = mentorTypes.array[indexPath.section].items.array[indexPath.item].full_name
//        vc.mentorID = mentorTypes.array[indexPath.section].items.array[indexPath.item].id
        self.navigationController?.show(vc, sender: self)
    }
    
    
}
