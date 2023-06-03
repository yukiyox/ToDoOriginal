//
//  TimeViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit
import NotificationCenter

class TimeViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveNotification(){
        let datePickerTime = datePicker.date
        
        let notificationTitle: String = "Title"
        let calendar = Calendar.current
        
        let trigger: UNCalendarNotificationTrigger = UNCalendarNotificationTrigger(dateMatching:calendar.dateComponents([.hour, .minute], from:
        datePickerTime), repeats: false)
        
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = notificationTitle
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let request: UNNotificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error: Error?) in
            
            if error != nil{
                
                print("error")
            } else {
                
                print("success")
            }
            
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
