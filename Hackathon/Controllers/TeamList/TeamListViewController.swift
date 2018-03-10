

import UIKit

class TeamListViewController: UIViewController {
	
    @IBOutlet weak var tableview: UITableView!
	var teams = [Team]()
    override func viewDidLoad() {
        super.viewDidLoad()
		
        setNavigationBar()
        tableview.tableFooterView = UIView()
		tableview.estimatedRowHeight = 100
		tableview.rowHeight = UITableViewAutomaticDimension
        ServerManager.shared.getTeams(getTeams, error: showErrorAlert)
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.title = Constants.teams
	}
	
    private func getTeams(teams: Teams) {
        self.teams = teams.array
        tableview.reloadData()
    }
	
//
//    func showListView() {
//        view.addSubview(listView)
//        listView.center = CGPoint(x: view.bounds.midX, y: 5)
//        listView.alpha = 0
//
//        UIView.animate(withDuration: 0.4) {
//            self.listView.alpha = 1
//            self.listView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
//        }
//    }
	
//    func hideListView() {
//        UIView.animate(withDuration: 0.4, animations: {
//            self.listView.alpha = 0
//            self.listView.center = CGPoint(x: self.view.bounds.midX, y: 5)
//        }) { (success) in
//            self.listView.removeFromSuperview()
//        }
//    }
}

extension TeamListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
		cell.setData(teams[indexPath.row])
		return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: "TeamDetailedViewController") as! TeamDetailedViewController
		vc.team = teams[indexPath.row]
		self.navigationController?.show(vc, sender: self)
    }
}

