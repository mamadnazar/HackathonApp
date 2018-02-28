//
//  FAQViewController.swift
//  Hackathon
//
//  Created by Mamadnazar on 2/14/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var faqs = FAQs()
    var questionCellExpanded = [Bool]()
    @IBOutlet weak var FAQTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        questionCellExpanded = [Bool](repeating: false, count: faqs.array.count)
        FAQTableView.rowHeight = UITableViewAutomaticDimension
        FAQTableView.estimatedRowHeight = 50
        ServerManager.shared.getFAQs(getFAQs, error: showErrorAlert)
        self.FAQTableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.faq
    }
    
    func getFAQs(faqs: FAQs) {
        self.faqs = faqs
        questionCellExpanded = [Bool](repeating: false, count: faqs.array.count)
        self.FAQTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return faqs.array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if questionCellExpanded[section] {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FAQTableView.dequeueReusableCell(withIdentifier: "faqTableViewCell") as! FAQTableViewCell

        if indexPath.row == 0 {
            cell.FAQQuestionLbl.text = faqs.array[indexPath.section].question
            cell.setQuestion()
        }
        else {
            cell.FAQQuestionLbl.text = faqs.array[indexPath.section].answer
            cell.setAnswer()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            questionCellExpanded[indexPath.section] = !questionCellExpanded[indexPath.section]
            tableView.reloadData()
            //tableView.beginUpdates()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
