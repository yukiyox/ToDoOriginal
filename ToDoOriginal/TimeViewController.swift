//
//  TimeViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit
import NotificationCenter

class TimeViewController: UIViewController {
    
    var notificationIdentifier: [String] = []
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
           navigationController?.popViewController(animated: true)
       }

    @IBAction func saveNotification(){
        
        for identifier in notificationIdentifier {
                   UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
               }
        
        let datePickerTime = datePicker.date
        
        let notificationTitle: String = "Check today's task"
        let calendar = Calendar.current
        
        let trigger: UNCalendarNotificationTrigger = UNCalendarNotificationTrigger(dateMatching:calendar.dateComponents([.hour, .minute], from:
        datePickerTime), repeats: false)
        
        let content: UNMutableNotificationContent = UNMutableNotificationContent()
        content.title = notificationTitle
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let request: UNNotificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        
        UNUserNotificationCenter.current().add(request) { (error: Error?) in
            
            if let error = error {
                print("Error: \(error)")
                    } else {
                print("Notification scheduled successfully")
                DispatchQueue.main.async {
                self.showAlertAndReturnHome()
    }
    }
    }
}
    func showAlertAndReturnHome() {
        let alertController = UIAlertController(title: "Notification Saved", message: "Your notification has been scheduled.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        self.navigationController?.popViewController(animated: true)
    }
        alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
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
