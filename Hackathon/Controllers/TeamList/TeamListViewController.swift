

import UIKit

class TeamListViewController: UIViewController {
    
    var selectedTeam: Int?
    var isSelected = false
    private var teams = Teams()
    private var members = Members()
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet var listView: UIView!
    @IBOutlet weak var dimissButton: UIButton!
    @IBOutlet weak var teamMembersTV: UITableView!
    @IBOutlet weak var listOfTeamsTV: UITableView!
    
    private let arrat = [[] , [] , ["" , ""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dimissButton.isHidden = true
        setNavigationBar()
        listOfTeamsTV.tableFooterView = UIView()
        
        let cn : String = Shared.shared.companyName ?? "Выберите команду"
        
        btnSelect.setTitle(cn,for: .selected)
        btnSelect.backgroundColor = UIColor.white
        btnSelect.layer.shadowColor = UIColor.lightGray.cgColor
        btnSelect.layer.shadowRadius = 10
        btnSelect.layer.shadowOpacity = 50
        btnSelect.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        ServerManager.shared.getTeams(getTeams, error: showErrorAlert)
    }
    
    private func getTeams(teams: Teams) {
        self.teams = teams
        self.listOfTeamsTV.reloadData()
    }

    private func getMembers (members: Members) {
        self.members = members
        self.teamMembersTV.reloadData()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.teams
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
        listView.center = CGPoint(x: view.bounds.midX, y: 5)
        listView.alpha = 0
        
        
        UIView.animate(withDuration: 0.4) {
            self.listView.alpha = 1
            self.listView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
            
        }
    }
    
    func hideListView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.listView.alpha = 0
            self.listView.center = CGPoint(x: self.view.bounds.midX, y: 5)
        }) { (success) in
            self.listView.removeFromSuperview()
        }
    }
    
    
}

extension TeamListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        if tableView == listOfTeamsTV {
            count = teams.array.count
        } else {
            if let selected = selectedTeam {
                count = teams.array[selected].members.array.count
                print(teams.array[selected].members.array.count)
            }
            else {
                return 0
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if tableView == listOfTeamsTV {
            cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
            cell.textLabel?.text = teams.array[indexPath.row].name
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.textLabel?.textColor = Style.Color.darkGray
            
        } else if tableView == teamMembersTV {
            cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
            
            if let index = selectedTeam {
                cell.textLabel?.text = teams.array[index].members.array[indexPath.item].full_name
            }
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.textLabel?.textColor = Style.Color.darkGray
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == listOfTeamsTV {
            hideListView()
            isSelected = true
            selectedTeam = indexPath.row
            print(indexPath.row)
            print(indexPath.section)
            self.dimissButton.isHidden = true
            btnSelect.setTitle(teams.array[indexPath.item].name, for: .normal)
            teamMembersTV.reloadData()
        }
        else {
            btnSelect.setTitle(teams.array[indexPath.section].name, for: .normal)
        }
    }
}

