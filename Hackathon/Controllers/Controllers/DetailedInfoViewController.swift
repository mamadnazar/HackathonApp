//
//  DetailedInfoViewController.swift
//  Hackathon
//
//  Created by Sanira Madzhikova on 2/28/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import Kingfisher

class DetailedInfoViewController: UIViewController {

	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var lblTitle: UILabel!
	@IBOutlet weak var textViewDescription: UITextView!
	@IBOutlet weak var lblDate: UILabel!
	@IBOutlet weak var textViewHeight: NSLayoutConstraint!
	@IBOutlet weak var imageHeight: NSLayoutConstraint!
	
	var _title: String = ""
	var _description: String = ""
	var imageUrl: String = ""
	var date: String = ""
	var link: String = ""
	var shouldFitImage = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		lblTitle.text = _title
		lblDate.text = date
		
		self.textViewDescription.text = _description
		self.textViewHeight.constant = textViewDescription.sizeThatFits(CGSize(width: self.textViewDescription.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height
		
		if let url = URL(string: self.imageUrl ) {
			imgView.kf.setImage(with: url)
		} else {
			imageHeight.constant = 0
		}
		if !link.isEmpty {
			let rightBarButtonItem = UIBarButtonItem.init(title: "Подробнее", style: .done, target: self, action: #selector(DetailedInfoViewController.openLink))
			
			self.navigationItem.rightBarButtonItem = rightBarButtonItem
		}
		if shouldFitImage {
			imgView.contentMode = .scaleAspectFit
		}
    }
	
	@IBAction func openLink() {
		guard let url = URL(string: self.link) else {
			return
		}
		
		if #available(iOS 10.0, *) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		} else {
			UIApplication.shared.openURL(url)
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
