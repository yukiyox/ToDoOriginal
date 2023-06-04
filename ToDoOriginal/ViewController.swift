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

