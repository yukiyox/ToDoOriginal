//
//  TimeViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit
import RealmSwift

class TimeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        
        // Do any additional setup after loading the view.
    }
    @objc func timePickerValueChanged(sender: UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "hh:mm:ss"
    
    }
    
    @IBAction var 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
