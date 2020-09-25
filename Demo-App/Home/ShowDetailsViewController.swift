//
//  showDetailsViewController.swift
//  Demo-App
//
//  Created by devin on 2020/9/1.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit

class ShowDetailsViewController: UIViewController {
    var itemNum:Int?
    
    let imagesLocal = ["Banner-1", "Banner-2", "Banner-3"]
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = imagesLocal[itemNum!]
        imgView.image = UIImage(named: imagesLocal[itemNum!])
    }
    
    @IBAction func getBack(_ sender: UIButton) {
        //返回到上一个页面
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
}
