//
//  ListTableViewCell.swift
//  ToDoOriginal
//
//  Created by Yukiyo Suenaga on 2023/05/30.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var taskView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListTableViewCell
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
