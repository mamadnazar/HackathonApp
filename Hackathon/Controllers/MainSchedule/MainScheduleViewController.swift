//
//  MainScheduleViewController.swift
//  Hackathon
//
//  Created by Khasanza on 3/7/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class MainScheduleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var segmentCollectionView: UICollectionView!
    //@IBOutlet weak var scrollingView: UIView!
    @IBOutlet weak var scheduleOuterCollectionView: UICollectionView!
    var scheduleTypes = ScheduleTypes()
    let segmentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Style.Color.yellow
        return view
    }()
    var segmentViewLeadingConstraint: NSLayoutConstraint?
    var segmentViewWidthConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBar()
        addSegmentView()
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.schedule
    }
    
    func getData() {
        ServerManager.shared.getScheduleTypes(setScheduleTypes, error: showErrorAlert)
    }
    
    func setScheduleTypes(scheduleTypes: ScheduleTypes) {
        self.scheduleTypes = scheduleTypes
        self.scheduleOuterCollectionView.reloadData()
        self.segmentCollectionView.reloadData()
        print(self.segmentCollectionView.bounds.width / (CGFloat(scheduleTypes.array.count)))
        segmentViewWidthConstraint?.constant = self.segmentCollectionView.bounds.width / (CGFloat(scheduleTypes.array.count))
        let indexPath = IndexPath(item: 0, section: 0)
        self.segmentCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
    }
    func scrollOuterCollectionView(segmentItem: Int) {
        let indexPath = IndexPath(item: segmentItem, section: 0)
        self.scheduleOuterCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    func addSegmentView() {
        self.view.addSubview(segmentView)
        segmentViewLeadingConstraint = segmentView.leadingAnchor.constraint(equalTo: self.segmentCollectionView.leadingAnchor)

        segmentViewLeadingConstraint?.isActive = true
        segmentViewWidthConstraint =             segmentView.widthAnchor.constraint(equalToConstant: 0)
//        let count = CGFloat(scheduleTypes.array.count)
//        if count == 0 {
//
//
//        }
//        else {
//            segmentViewWidthConstraint = segmentView.widthAnchor.constraint(equalToConstant: self.segmentCollectionView.bounds.width / (CGFloat(scheduleTypes.array.count)))
//        }
        segmentViewWidthConstraint?.isActive = true
        NSLayoutConstraint.activate([
            segmentView.heightAnchor.constraint(equalToConstant: 4),
            segmentView.bottomAnchor.constraint(equalTo: segmentCollectionView.bottomAnchor, constant: -4)
            ])
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleTypes.array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == segmentCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleBarCellID", for: indexPath) as! ScheduleBarCollectionViewCell
            cell.scheduleBarLabel.text = scheduleTypes.array[indexPath.item].date
           
            let selectedIndexPath = NSIndexPath(item: 0, section: 0)
            collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outerCollectionViewCellID", for: indexPath) as! ScheduleDataCollectionViewCell
            cell.fillCell(schedules: scheduleTypes.array[indexPath.item].events)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == segmentCollectionView {
//            let x = self.view.frame.width * CGFloat(indexPath.item) / 3
//            self.segmentViewLeadingConstraint?.constant = x
//
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                self.view.layoutIfNeeded()
//            }, completion: nil)
            scrollOuterCollectionView(segmentItem: indexPath.item)
        } else {
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == segmentCollectionView {
            let width = self.scheduleOuterCollectionView.bounds.width / CGFloat(scheduleTypes.array.count)
            let height = self.scheduleOuterCollectionView.bounds.height
            return CGSize(width: width, height: height)

        } else {
            let width = self.scheduleOuterCollectionView.bounds.width
            let height = self.scheduleOuterCollectionView.bounds.height
            return CGSize(width: width, height: height)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        segmentCollectionView.selectItem(at: indexPath as IndexPath, animated: false, scrollPosition: [])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.segmentViewLeadingConstraint?.constant = scrollView.contentOffset.x / CGFloat(scheduleTypes.array.count)
    }
    
    

}

