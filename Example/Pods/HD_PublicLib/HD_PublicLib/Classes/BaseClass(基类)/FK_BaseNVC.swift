//
//  HD_BaseBVC.swift
//  HouDa_FaKao
//
//  Created by 波 on 05/01/2018.
//  Copyright © 2018 波波. All rights reserved.
//

import UIKit

open class HD_BaseNVC: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
//        self.isNavigationBarHidden = true
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.main
        navBar.shadowImage = nil
        navBar.setBackgroundImage(UIImage.init(named: "home_navBar"), for: .default)

//        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)]
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true

            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"<<", style: .plain, target: self, action: #selector(navigationBackClick))
//
//           viewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
            self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;
//
        }

        super.pushViewController(viewController, animated: true)
    }
    
    /// 返回按钮
    @objc func navigationBackClick() {
        if ((self.navigationController != nil) || (self.presentedViewController != nil ) && self.childViewControllers.count == 1) {
            _ = dismiss(animated: true, completion: nil)
            
        }else{
            _ = popViewController(animated: true)
        }
    }
    
    
    
    
}
