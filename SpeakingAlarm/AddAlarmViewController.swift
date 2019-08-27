//
//  ViewController.swift
//  SpeakingAlarm
//
//  Created by Swapna Gupta on 8/11/19.
//  Copyright © 2019 Gupta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var timePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveTapped(_sender: UIBarButtonItem) {
        print("The save button was tapped")
        
        // let time = timePicker. (FINISH!)
        
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
        
        if let uniqueId = newAlarm.alarmID {
            print("The alarmID is \(uniqueId)")
        }
        
        do {
            try context.save()
        } catch let error {
            print("Could not save because of \(error).")
        }
        
        dismiss(animated: true, completion: nil)
    }

    // override func didReceiveMemoryWarning() {
       // super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    // }

}

