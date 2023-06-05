//
//  ViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var todoItem: Results<ToDo>!
    
    
    
    @IBOutlet var todayLabel: UILabel!
    
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    
    var number: Int!
    var todayTask: String!
    
   var taskarray: [ToDo] = []
    
    var myData: [String] = ["Eat Breakfast", "Walk my dog", "Clean my shelf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            let realm = try! Realm()
            todoItem = realm.objects(ToDo.self)
        
    taskarray = Array(todoItem)
        
        todayLabel.layer.cornerRadius = 25
        
        doneButton.layer.cornerRadius = 5
        skipButton.layer.cornerRadius = 5
        
        number = Int.random(in: 0 ..< taskarray.count)
        
        todayTask = taskarray[number].title
        
        todayLabel.text = todayTask
    }
    @IBAction func doneButtonClicked() {
        
        todayLabel.text = "Have a wonderful day!"
    }

    @IBAction func skipButtonClicked() {
        
        number = Int.random(in: 0 ..< taskarray.count)
        todayTask = taskarray[number].title
        todayLabel.text = todayTask
    }
    
}
    
extension ViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    

    
    }
    
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                cell.textLabel?.text = myData[indexPath.row]
                return cell
    }
    
    
}

