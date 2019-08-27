//
//  AlarmsTableViewController.swift
//  SpeakingAlarm
//
//  Created by Swapna Gupta on 8/11/19.
//  Copyright © 2019 Gupta. All rights reserved.
//

import UIKit
import CoreData

class AlarmsTableViewController: UITableViewController {
    
    var alarms = [Alarm]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = Alarm.fetchRequest() as NSFetchRequest<Alarm>
    
        do {
            alarms = try context.fetch(fetchRequest)
        } catch let error {
            print("Could not fetch because of error: \(error).")
        }
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCellIdentifier", for: indexPath)
        let alarm = alarms[indexPath.row]
        
        cell.textLabel?.text = alarm.name
        cell.detailTextLabel?.text = String(alarm.hour) + ":" + String(alarm.minute)
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

}
