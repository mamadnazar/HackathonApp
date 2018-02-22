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
    
    var faqs = FAQs()
    
    @IBOutlet weak var FAQTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBar()
        ServerManager.shared.getFAQs(getFAQs, error: showErrorAlert)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Вопросы и ответы"
    }
    
    func getFAQs(faqs: FAQs) {
        self.faqs = faqs
        self.FAQTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqs.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FAQTableView.dequeueReusableCell(withIdentifier: "faqTableViewCell") as! FAQTableViewCell
        
        cell.FAQQuestionLbl.text = faqs.array[indexPath.item].question
        cell.FAQAnswerLbl.text = faqs.array[indexPath.item].answer
        return cell
    }

}
