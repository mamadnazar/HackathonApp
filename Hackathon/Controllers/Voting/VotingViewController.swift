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
        ServerManager.shared.getVotingStatus({ (status) in
            self.showCamera()

            //self.showErrorAlert(message: message)
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
	
	func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
		if metadataObjects != nil && metadataObjects.count != 0 {
			if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
				if object.type == AVMetadataObject.ObjectType.qr {
                    print(object.stringValue)
                    qrc = object.stringValue
                    ServerManager.shared.checkQR(qr: object.stringValue!, { (teams) in
                        self.teams = teams
                        self.votingTableView.isHidden = false
                        //print(teams.array[0])
                    }, error: { (message) in
                        //self.showErrorAlert(message: message)
                        
                        self.session.stopRunning()
                self.video.isHidden = true
                        self.dismiss(animated: true, completion: nil)
                        
                    })
				}
			}
		}
        
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
        self.selectedTeamID = teams.array[indexPath.row].id
        let alert = UIAlertController(title: "Вы действительно хотите проголосовать за выбранную команду?", message: "", preferredStyle: .alert)
        let sureAction = UIAlertAction(title: "Да", style: .default) { (action) in
            let imei = UIDevice.current.identifierForVendor!.uuidString
            print("UUID: \(imei)")
            ServerManager.shared.voteForTeam(qr: self.qrc!, imei: imei, teamId: self.selectedTeamID!, { (message) in
                let alert = UIAlertController(title: "Вы успешно проголосовали", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                //votingTableView.isHidden = true
                //self.lblMessage.text = "You already voted"
            }, error: self.showErrorAlert)
        }
        let cancel = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        alert.addAction(sureAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
