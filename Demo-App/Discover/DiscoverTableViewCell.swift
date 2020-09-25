//
//  TableViewCell.swift
//  Demo-App
//
//  Created by devin on 2020/9/1.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rightBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(11111);
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
//        print("Selected!");
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
 
}
