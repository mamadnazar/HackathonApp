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

    var video = AVCaptureVideoPreviewLayer()
    
    @IBOutlet weak var qrFrame: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar()
        
        let session = AVCaptureSession()
        
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
                    let alert = UIAlertController(title: "QR code", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (nil) in
                        UIPasteboard.general.string = object.stringValue
                    }))
                    
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Голосование"
    }
    
}
