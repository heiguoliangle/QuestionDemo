//
//  ViewController.swift
//  HD_TSShoppingMall
//
//  Created by heiguoliangle@163.com on 01/31/2018.
//  Copyright (c) 2018 heiguoliangle@163.com. All rights reserved.
//

import UIKit
import HD_PublicLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.white
        title = "首页"
        
        let btn = UIButton(frame: CGRect(x: 50, y: 100, width: 200, height: 100))
        btn.setTitle("跳转到图书商城", for: UIControlState.normal)
        btn.setTitleColor(UIColor.red, for: UIControlState.normal)
        btn.addTarget(self, action: #selector(test), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func test() {
        let vc = HD_TSShoppingVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

