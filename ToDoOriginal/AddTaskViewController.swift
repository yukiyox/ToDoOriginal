//
//  AddTaskViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit
import RealmSwift

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleTextField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self

        let memo: Memo? = read()
        
        titleTextField.text = memo?.title
        
        // Do any additional setup after loading the view.
    }
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }

    @IBAction func save() {
        let title: String = titleTextField.text!
        
        let memo: Memo? = read()
        
        if memo != nil {
            try! realm.write {
                memo!.title
        }
    } else {
        let newMemo = Memo()
        newMemo.title = title
                
        try! realm.write {
            realm.add(newMemo)
        }
    }
    
        let alert: UIAlertController = UIAlertController(title: "Success", message: "Task Saved", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
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
