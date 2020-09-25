//
//  TableViewCell.swift
//  Demo-App
//
//  Created by devin on 2020/9/1.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cusTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
 
}
