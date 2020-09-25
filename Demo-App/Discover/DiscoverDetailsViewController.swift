//
//  DiscoverDetailsViewController.swift
//  Demo-App
//
//  Created by devin on 2020/9/10.
//  Copyright © 2020 devin. All rights reserved.
//

import UIKit
import WebKit

class DiscoverDetailsViewController:  UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        loadControl(ctrl: self.title!)
        let btn = UIBarButtonItem(title: "代码", style: .plain, target: self, action: #selector(btnClicked))
        self.navigationItem.rightBarButtonItem = btn
    }
    
    func loadControl(ctrl:String){
        switch(ctrl){
        case "JiFang":
            let label = UILabel(frame: self.view.bounds)
            label.backgroundColor = UIColor.clear
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 36)
            label.text = "Hellow"
            self.view.addSubview(label)
        case "Acquired":
            let button = UIButton(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
            button.backgroundColor = UIColor.brown
            button.setTitleColor(UIColor.orange, for: .normal)
            button.setTitleColor(UIColor.red, for: .highlighted)
            button.setTitle("点击我", for: .normal)
            button.addTarget(self, action: #selector(Clicked), for: .touchUpInside)
            self.view.addSubview(button)
        case "Treker":
            let slider = UISlider(frame: CGRect(x: 110, y: 250, width: 200, height: 300))
            self.view.addSubview(slider)
        case "Quint":
            let WebView = WKWebView(frame: self.view.frame)
            let url = URL(string: "https://blog.csdn.net/weixin_43704791")
            let request = URLRequest(url: url!)
            WebView.load(request)
            self.view.addSubview(WebView)
        default:
            print("error")
        }
    }
    
    func loadCode(ctrl:String){
        var str:String
        switch ctrl {
        case "JiFang":
            str = "let label = UILabel(frame: self.view.bounds)"
            str += "label.backgroundColor = UIColor.clear"
            str += "label.textAlignment = .center"
            str += "label.font = UIFont.systemFont(ofSize: 36)"
            str += "label.text = Hellow"
        case "Acquired":
            str =  "let button = UIButton(frame: CGRect(x: 110, y: 250, width: 100, height: 100))"
            str += "button.backgroundColor = UIColor.brown"
            str += "button.setTitleColor(UIColor.orange, for: .normal)"
            str += "button.setTitleColor(UIColor.red, for: .highlighted)"
            str += "button.setTitle(\"点击我\", for: .normal)"
            str += "button.addTarget(self, action: #selector(Clicked(_:)), for: .touchUpInside)"
            str += "self.view.addSubview(button)"
        case "Treker":
            str = "省略"
        case "Quint":
            str = "........"
        default:
            str = "nil"
        }
        let text = UITextView(frame: self.view.frame)
        text.text = str
        
//        // 状态栏
//        let statusFrame = UIApplication.shared.statusBarFrame
//        print(statusFrame)
        var marginTop:CGFloat = 0
        if let rect = self.navigationController?.navigationBar.frame {
            marginTop = rect.height + rect.origin.y
        }
        
        text.frame.origin.y = marginTop
        self.view.addSubview(text)
    }
    
    func clearViews(){
        for i in self.view.subviews as [UIView]{
            i.removeFromSuperview()
        }
    }
    @objc func btnClicked(){
        clearViews()
        if self.navigationItem.rightBarButtonItem?.title == "代码"{
            loadCode(ctrl: self.title!)
            self.navigationItem.rightBarButtonItem?.title = "效果"
        }else{
            self.navigationItem.rightBarButtonItem?.title = "代码"
            loadControl(ctrl: self.title!)
        }
    }
    
    @objc func Clicked(){
        print("点击了一下")
    }
}
