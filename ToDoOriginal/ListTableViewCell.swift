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
        
        

    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
