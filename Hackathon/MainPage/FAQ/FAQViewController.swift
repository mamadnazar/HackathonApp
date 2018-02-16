//
//  FAQViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let faqQuestions = ["Is throwing your hair into garbage safe?", "HOW DO I TURN OFF CAPSLOCK?", "Which is worse ignorance or apathy?"]
    let faqAnswers = ["If you're worried about someone stealing your DNA, you could collect your hair and create a hair sculpture", "Emmmm..", "I do not know and I do not care"]
    
    
    @IBOutlet weak var FAQTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FAQTableView.dequeueReusableCell(withIdentifier: "faqTableViewCell") as! FAQTableViewCell
        
        cell.FAQQuestionLbl.text = faqQuestions[indexPath.row]
        cell.FAQAnswerLbl.text = faqAnswers[indexPath.row]
        return cell
    }

}
