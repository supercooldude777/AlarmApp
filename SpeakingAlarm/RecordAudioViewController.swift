//
//  RecordAudioViewController.swift
//  SpeakingAlarm
//
//  Created by Swapna Gupta on 9/14/19.
//  Copyright © 2019 Gupta. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class RecordAudioViewController: UIViewController {
    
    var recordingSession: AVAudioSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Test"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Record", style: .plain, target: nil, action: nil)
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
//            try recordingSession.setCategory(.playAndRecord, mode: .default)
//            try recordingSession.setActive(true)
//            recordingSession.requestRecordPermission() { [unowned self] allowed in
//                DispatchQueue.main.async {
//                    if allowed {
//                        self.loadRecordingUI()
//                    } else {
//                        self.loadFailUI()
//                    }
//                }
//            }
    } catch {
        self.loadFailUI()
    }
}
    func loadRecordingUI() {
    }
    
    func loadFailUI() {
    }
}
