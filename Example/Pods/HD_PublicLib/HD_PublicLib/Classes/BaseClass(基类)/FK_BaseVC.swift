//
//  HD_BaseVC.swift
//  HouDa_FaKao
//
//  Created by 波 on 05/01/2018.
//  Copyright © 2018 波波. All rights reserved.
//

import UIKit
import MBProgressHUD


open class HD_BaseVC: UIViewController {
   

   open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
      
    }
}

// MARK: - 提示语
extension HD_BaseVC{
   open func showLoading() {
        self.hidenLoading()
        DispatchQueue.main.async {
          
        MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
   open func hidenLoading() {
         DispatchQueue.main.async {
        MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
   open func showSuccess(_ message: String = "成功") {
       DispatchQueue.main.async {
        self.showMessage(message, icon: "success.png")
        }
    }
   open func showError(_ message: String = "失败") {
        DispatchQueue.main.async {
        self.showMessage(message, icon: "error.png")
        }
    }
    
    
    fileprivate  func showMessage(_ message: String, icon: String) {
         DispatchQueue.main.async {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = message
        hud.customView = UIImageView.init(image: UIImage.init(named: "MBProgressHUD.bundle\(icon)"))
        hud.mode = .customView
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1.5)
        }
    }
    
}
