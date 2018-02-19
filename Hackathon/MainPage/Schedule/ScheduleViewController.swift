//
//  ScheduleViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/19/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ScheduleViewController: SJSegmentedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let storyboard = self.storyboard {
            
            let headerController = storyboard
                .instantiateViewController(withIdentifier: "HeaderViewController")
            
            let firstViewController = storyboard
                .instantiateViewController(withIdentifier: "FirstViewController")
            firstViewController.title = "First"
            
            let secondViewController = storyboard
                .instantiateViewController(withIdentifier: "SecondViewController")
            secondViewController.title = "Second"
            
            //            let fourthViewController = storyboard.instantiateViewController(withIdentifier: "FourthViewController") //as? FourthViewController
            //            fourthViewController.title = "Fourth"
            //            fourthViewController.loadViewController = { (index) in
            //                self.setSelectedSegmentAt(index, animated: true)
            //            }
            
            headerViewController = headerController
            segmentControllers = [firstViewController, secondViewController]
            headerViewHeight = 200
            selectedSegmentViewHeight = 5
            headerViewOffsetHeight = 31
            segmentTitleColor = .gray
            selectedSegmentViewColor = .green
            segmentShadow = SJShadow.light()
            showsHorizontalScrollIndicator = false
            showsVerticalScrollIndicator = false
            segmentBounces = true
            delegate = self as! SJSegmentedViewControllerDelegate
            
            //let segmentedViewController = SJSegmentedViewController(headerViewController: headerViewController, segmentControllers: [firstViewController, secondViewController])
        }
        title = "Segment"
        super.viewDidLoad()
    }



}
