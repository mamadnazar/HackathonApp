//
//  FeedbackViewController.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var feedbackTextView: UITextView!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var addFeedbackButton: UIButton!
    
    @IBAction func addFeedBackButtonAction(_ sender: Any) {
        let feedback = Feedback(feedback_text: feedbackTextView.text!, contact: contactTextField.text!, time_added: "")
        ServerManager.shared.addFeedbacks(feedback: feedback, feedbackAdded, error: showErrorAlert)
    }
    
    func feedbackAdded() {
        alertAppear(title: "Отзыв отправлен" , message: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func alertAppear(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

