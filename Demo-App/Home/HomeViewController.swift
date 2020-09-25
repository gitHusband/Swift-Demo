//
//  FisrtViewController.swift
//  Demo-App
//
//  Created by devin on 2020/8/26.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!

    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addloopView()
        
        fixHeaderLabel()
        
        let button1 = self.view.viewWithTag(2)
        FixButton(button: button1 as! UIButton)
        let button2 = self.view.viewWithTag(3)
        FixButton(button: button2 as! UIButton)
        let button3 = self.view.viewWithTag(4)
        FixButton(button: button3 as! UIButton)
        let button4 = self.view.viewWithTag(5)
        FixButton(button: button4 as! UIButton)
        let button5 = self.view.viewWithTag(6)
        FixButton(button: button5 as! UIButton)
    }
    
    private func addloopView() {
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 230)
        let imagesLocal = NSArray(array: ["Banner-1", "Banner-2", "Banner-3"])
        let loopView = ADLoopView(frame: frame, images: imagesLocal, placeholder: UIImage(named: "ad"))
        loopView.delegate = self
        loopView.pagePosition = .center
        loopView.setPageImge(pageImage: "page", currentPageImage: "currentPage")
//        loopView.setPageImge(pageImage: "page", currentPageImage: "currentPage", dotWidth: 50, dotHeight: 6, dotMargin: 10)
        view.addSubview(loopView)
    }
    
    private func fixHeaderLabel() {
//        let headerLabel = self.view.viewWithTag(1)
        
        let headerLabel = self.headerLabel
        
//        print(headerLabel?.layer)
        
        let leftLine = CALayer()
        leftLine.frame = CGRect(x: 0, y: 6, width: 4, height: (headerLabel?.bounds.height ?? 20) - 12)
        leftLine.backgroundColor = UIColor.blue.cgColor
        headerLabel?.layer.addSublayer(leftLine)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: headerLabel?.bounds.height ?? 70, width: UIScreen.main.bounds.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        headerLabel?.layer.addSublayer(bottomLine)
    }
    
    private func FixButton(button: UIButton) {
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -(button.imageView?.frame.size.width ?? 10), bottom: -(button.imageView?.frame.size.height ?? 10), right: 0)
        
        button.imageEdgeInsets = UIEdgeInsets(top: -(button.titleLabel?.intrinsicContentSize.height ?? 10) - 20, left: 0, bottom: 0, right: -(button.titleLabel?.intrinsicContentSize.width ?? 10))
    }
    
    @IBAction func ticketCheckAlert(_ sender: UIButton) {
        let alertController = UIAlertController(
            title: "票证查验",
            message: "对不起！你的票证已失效！",
            preferredStyle: UIAlertController.Style.alert
        )
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default,
                handler: nil
            )
        )
        present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            print(sender as! Int)
            
            let controller = segue.destination as! ShowDetailsViewController
            controller.itemNum = sender as? Int
        }
    }
}

/// ADLoopView代理方法
extension HomeViewController: ADLoopViewDelegate {
    func adLoopView(adLoopView: ADLoopView, index: NSInteger) {
        print("点击了第\(index)张图片")
        performSegue(withIdentifier: "showDetails", sender: index)
    }
}

extension HomeViewController {
    /// 转换状态栏颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
