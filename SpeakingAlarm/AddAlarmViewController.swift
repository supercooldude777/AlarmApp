//
//  ViewController.swift
//  SpeakingAlarm
//
//  Created by Swapna Gupta on 8/11/19.
//  Copyright © 2019 Gupta. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import AVFoundation

class AddAlarmViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var timePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveTapped(_sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newAlarm = Alarm (context: context)
        let name = nameTextField.text ?? ""
        newAlarm.name = name
        newAlarm.alarmID = UUID().uuidString
        
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour!
        let minute = components.minute!
        
        newAlarm.hour = Int16(hour)
        newAlarm.minute = Int16(minute)
        
        do {
            try context.save()
            let message = "Hey! Wake up!"
            let content = UNMutableNotificationContent()
            content.body = message
            //content.sound = UNNotificationSound.default()
            content.sound = UNNotificationSound.init(named: "7.m4a")
            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents,
                                                        repeats: true)
            if let identifier = newAlarm.alarmID {
            let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                let center = UNUserNotificationCenter.current()
                center.add(request, withCompletionHandler: nil)
            }
                
        }
            
         catch let error {
            print("Could not save because of \(error).")
        }
        
        let fileName = "Test"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        let text = "my text for my text file"
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("failed with error: \(error)")
        }
        
        do {
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            print("Read back text: \(text2)")
        }
        catch {
            print("failed with error: \(error)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // override func didReceiveMemoryWarning() {
       // super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    // }
    
    func startRecording() {
//        recordingSession = AVAudioSession.sharedInstance()
//
//        do {
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
//        } catch {
//            self.loadFailUI()
//        }
    }

}

