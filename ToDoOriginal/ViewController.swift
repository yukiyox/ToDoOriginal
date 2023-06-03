//
//  ViewController.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var MainLabel: UILabel!
    
    @IBOutlet var DoneButton: UIButton!
    @IBOutlet var SkipButton: UIButton!
    
    let array: [OriginalTask] = ["Eat Breakfast", "Walk my dog", "Clean shelf", "Dance", "Cook a meal"]
    if let value = array.randomElement(){
        print(value)
    }
    
    var myData: [String] = ["Eat Breakfast", "Walk my dog", "Clean my shelf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MainLabel.layer.cornerRadius = 25
        
        DoneButton.layer.cornerRadius = 5
        SkipButton.layer.cornerRadius = 5
        
        func shuffle() {
            for _ in array {
                let swap1 = Int.random(in: 0..<array.count)
                try! realm.write {
                    list.swapAt(swap1)
                }
            }
        }
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

