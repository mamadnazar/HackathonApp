//
//  TeamListVC.swift
//  Hackathon
//
//  Created by ITLabAdmin on 2/21/18.
//  Copyright © 2018 neobis. All rights reserved.
//
import UIKit

class TeamListViewController: UIViewController {
    
    let listOfTeams = ["Neobis" , "Neobis1" , "Neobis2" , "Neobis3" , "Neobis4" , "Neobis5" , "Neobis6" , "Neobis7"]
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet var listView: UIView!
    @IBOutlet weak var dimissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dimissButton.isHidden = true
        setNavigationBar()
        
        let cn : String = Shared.shared.companyName ?? "Select Team"
        btnSelect.setTitle(cn,for: .selected)
        btnSelect.backgroundColor = UIColor.white
        btnSelect.layer.shadowColor = UIColor.lightGray.cgColor
        btnSelect.layer.shadowRadius = 10
        btnSelect.layer.shadowOpacity = 50
        btnSelect.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Список команд"
    }
    
    @IBAction func openTeamListVC(_ sender: UIButton) {
        showListView()
        dimissButton.isHidden = false
    }
    
    @IBAction func closeTeamListVC(_ sender: UIButton) {
        hideListView()
        dimissButton.isHidden = true
    }
    
    
    func showListView() {
        view.addSubview(listView)
        listView.center = CGPoint(x: view.bounds.midX, y: 140)
        listView.alpha = 0
        
        
        UIView.animate(withDuration: 0.4) {
            self.listView.alpha = 1
            self.listView.center = self.view.center
            
        }
    }
    
    func hideListView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.listView.alpha = 0
            self.listView.center = CGPoint(x: self.view.bounds.midX, y: -200)
        }) { (success) in
            self.listView.removeFromSuperview()
        }
    }
    
    
}

extension TeamListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = listOfTeams[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor(red: 246/255, green: 85/255, blue: 81/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hideListView()
        self.dimissButton.isHidden = true
        btnSelect.titleLabel?.text = listOfTeams[indexPath.row]
    }
    
    
}
