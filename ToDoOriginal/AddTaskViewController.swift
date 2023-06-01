//
//  AddTaskViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit
import RealmSwift

class ToDo: Object {
    @objc dynamic var title = ""
}

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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let newTodo = ToDo()
        
        // textFieldに入力したデータをnewTodoのtitleに代入
        newTodo.title = titleTextField.text!
        
        // 上記で代入したテキストデータを永続化するための処理
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newTodo)
                print("ToDo Saved")
            })
        }catch{
            print("Save is Failed")
            
            
        }
        let alert = UIAlertController(
            title: "Success",
            message: "New task saved",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated: true)
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
