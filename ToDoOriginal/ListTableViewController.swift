import UIKit
import RealmSwift

class ListTableViewController: UITableViewController {
    
    var todoItem: Results<ToDo>!
    @IBOutlet var taskView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        do {
            let realm = try Realm()
            todoItem = realm.objects(ToDo.self)
            tableView.reloadData()
        } catch {
            // Handle error
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = todoItem[indexPath.row].title

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete(todoItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: .fade)
            } catch {
                // Handle error
            }
            tableView.reloadData()
        }
    }
}
