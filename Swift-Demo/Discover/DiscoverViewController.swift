//
//  DiscoverViewController.swift
//  Swift-Demo
//
//  Created by devin on 2020/8/26.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var products = [
        ["name":"JiFang","location":"Foshan","employees":30,"type":1,"desc":"Foshan Jifang Ltd","logo":"Mainlogo-JiFang"],
        ["name":"Acquired","location":"UK","employees":50,"type":1,"desc":"UK Acquired Ltd","logo":"lg-Acquired"],
        ["name":"Treker","location":"US","employees":80,"type":2,"desc":"USA Treker Safe Traval","logo":"lg-Treker"],
        ["name":"Quint","location":"Foshan","employees":200,"type":1,"desc":"Quint Group UK Manchester","logo":"lg-Quint"],
        ["name":"Bitscube","location":"USA","employees":30,"type":1,"desc":"Bitscube Tech Ltd","logo":"lg-BitsCube"]
    ]
    
    @IBOutlet weak var discoverTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.discoverTable.delegate = self
        self.discoverTable.dataSource = self
        self.discoverTable.register(UITableViewCell.self, forCellReuseIdentifier: "ReusedCell1")
    }
    
    //一个分区里面有多少行，我们这里不分区，所以就是总共有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count   //行数
    }
    
    //每一行都是一个Cell，这个函数就定义每一个Cell具体是怎样呈现的
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         dequeueReusableCell：
            界面空间有限，比如我们有100个单元格，但是只能显示10个，在滚动的时候，这个属性就先保存滚动出界面的单元格，保存到可重用队列当中，在我们再次需要用到以前的单元格的时候，就再次从队列中取出来就可以了，这样就省去了删除和重建单元格带来的开销。
         */
        //cell1 是我们前面给 Cell 设定的辨识 id
        let cell:DiscoverTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! DiscoverTableViewCell
        
        /**
            indexPath 有两个非常重要的属性:
                row: 当前的行
                session: 当前所在分区
         */
        cell.textLabel?.text = products[indexPath.row]["name"] as? String
        cell.detailTextLabel?.text = products[indexPath.row]["desc"] as? String
        cell.imageView?.image = UIImage(named: "TarBarIcon-Discover-24")
//        cell.rightBtn?.setImage(UIImage(named: "TarBarIcon-Discover-24"), for: UIControl.State.normal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    //点击事件-打开详情页
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let discoverDetailsVC = DiscoverDetailsViewController()
        discoverDetailsVC.title = self.products[indexPath.row]["name"] as! String
        self.navigationController?.pushViewController(discoverDetailsVC, animated: true)
    }
}
