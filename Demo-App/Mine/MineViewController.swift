//
//  MineViewController.swift
//  Demo-App
//
//  Created by devin on 2020/8/26.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit

class MineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var MineDetails = [
        [
            ["name": "我的简历"]
        ],
        [
            ["name": "我的收藏"],
            ["name": "我的导师"],
            ["name": "联系客服"],
            ["name": "关于"],
        ],
        [
            ["name": "设置"]
        ],
    ]
    
    @IBOutlet weak var MineTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MineTable.delegate = self
        self.MineTable.dataSource = self
        self.MineTable.register(UITableViewCell.self, forCellReuseIdentifier: "ReusedCell2")
        
    }
    
    //分区个数
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return MineDetails.count
    }
    
    //每个分区里面有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        let key = keys[section]            //获取当前分区的名称
//        let nameSection = names[key]!      //获取数据中对应到当前分区的个数
        return MineDetails[section].count           //这样就可以设定每个分区有多少个了
    }
    
    //设置每个分区的名称
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "分区 \(section)"
    }
    
    //设置头视图的View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let rect = CGRect(x: 0, y: 0, width: 100, height: 10)
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGray5
        return headerView
    }
     
    //返回分区头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
        
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    
    //定义每个 Cell 怎么呈现
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //注意要回到界面中给“分区”中的 Cell 设定辨识 id 为“cell2”
        let cell:MineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! MineTableViewCell
        cell.cusTitleLabel?.text = MineDetails[indexPath.section][indexPath.row]["name"]   //然后根据当前分区的第几行，来取出第几个数据

        return cell
    }
}
