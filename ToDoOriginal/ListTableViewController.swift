import UIKit
import RealmSwift

class ListTableViewController: UITableViewController {
    
    var todoItem: Results<ToDo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let realm = try Realm()
            todoItem = realm.objects(ToDo.self)
            tableView.reloadData()
        } catch {
            // Handle error
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        let label = cell.contentView.viewWithTag(1) as! UILabel
        
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
