//
//  VotingViewController.swift
//  Hackathon
//
//  Created by Risolat Fayzmamadova on 2/26/18.
//  Copyright © 2018 neobis. All rights reserved.
//

import UIKit
import AVFoundation

class VotingViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    
    @IBOutlet weak var votingTableView: UITableView!
    var teams = Teams()
    let session = AVCaptureSession()
    var selectedTeamID: Int?
    var qrc: String?
    var video = AVCaptureVideoPreviewLayer()
    @IBOutlet weak var qrFrame: UIImageView!
	@IBOutlet weak var lblMessage: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Голосование"
		if DataManager.shared.isVoted() {
			self.lblMessage.text = "Вы уже голосовали"
			return
		}
        ServerManager.shared.getVotingStatus({ (status) in
            self.showCamera()
        }) { (message) in
            self.lblMessage.text = message

        }
        
    }
	func showCamera() {

		let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
		
		do {
			let input = try AVCaptureDeviceInput(device: captureDevice!)
			session.addInput(input)
		}
		catch {
			print("ERROR")
		}
		
		let output = AVCaptureMetadataOutput()
		session.addOutput(output)
		
		output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
		output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
		
		video = AVCaptureVideoPreviewLayer.init(session: session)
		//video1 = AVCaptureVideoPreviewLayer[session: session]
		video.frame = view.layer.bounds
		view.layer.addSublayer(video)
		self.view.bringSubview(toFront: qrFrame)
		session.startRunning()

	}
	func checkQrCode(code: String?) {
		guard let code = code else {
			return
		}
		qrc = code
		ServerManager.shared.checkQR(qr: code, showTeams, error: showErrorMessage)
	}
	
	func showErrorMessage(message: String) {
		 self.lblMessage.text = message
	}
	
	func showTeams(teams: Teams) {
		self.teams = teams
		votingTableView.isHidden = false
		votingTableView.reloadData()
		session.stopRunning()
		video.removeFromSuperlayer()
		
	}
	func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
		guard !metadataObjects.isEmpty else {
			return
		}
		guard let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else {
			return
		}
		guard object.type == AVMetadataObject.ObjectType.qr else {
			return
		}
		if self.qrc == object.stringValue {
			return
		}
		self.checkQrCode(code: object.stringValue)
		
    }
	func voteForTeam(id: Int) {
		let imei = UIDevice.current.identifierForVendor!.uuidString
		
		ServerManager.shared.voteForTeam(qr: qrc!, imei: imei, teamId: id, { (message) in
			DataManager.shared.setVote()
			self.lblMessage.text = message
			self.votingTableView.isHidden = true
		}, error: { (message) in
			DataManager.shared.setVote()
			self.votingTableView.isHidden = true
			self.lblMessage.text = message
		})
	}
	
    
}
extension VotingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VotingTableViewCellID", for: indexPath) as! VotingTableViewCell
        cell.teamNameLabel.text = teams.array[indexPath.row].name
        cell.projectNameLabel.text = teams.array[indexPath.row].project_name
        return cell
    }
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.alert(message: "Вы действительно хотите проголосовать за выбранную команду?", {
			self.voteForTeam(id: self.teams.array[indexPath.row].id!)
		}) {}
    }
}
