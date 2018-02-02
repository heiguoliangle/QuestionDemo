//
//  HD_TSShoppingTVC.swift
//  HD_TSShoppingMall_Example
//
//  Created by heiguoliangle on 2018/1/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

 class HD_TSShoppingTVC: UIViewController {
    
    let kCellidentif : String = "HD_TSShoppingTVCCell"
    public var models : [ HD_TSShoppingCellModel]? {
        didSet {
            tabelView.reloadData()
        }
    }
    
    lazy var tabelView : UITableView = {
        
        let tab = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tab.dataSource = self
        tab.delegate = self
        tab.register(HD_TSShoppingTVCell.self, forCellReuseIdentifier:kCellidentif )
        return tab
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tabelView)
     
        
    }

}
 // MARK: - UITableViewDelegate,UITableViewDataSource
extension HD_TSShoppingTVC : UITableViewDelegate,UITableViewDataSource{
     // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (models?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: kCellidentif) as! HD_TSShoppingTVCell
        let model = models![indexPath.row]
        cell.bookModel = model
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
