//
//  HD_TSSearchVC.swift
//  HD_TSShoppingMall_Example
//
//  Created by heiguoliangle on 2018/2/2.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class HD_TSSearchVC: UIViewController {
    let kCellidentif : String = "HD_TSSearchVCCell"
    fileprivate var searchBar : UISearchBar!
    lazy var tabelView : UITableView = {
        
        let tab = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        tab.dataSource = self
        tab.delegate = self
        tab.register(HD_TSShoppingTVCell.self, forCellReuseIdentifier:kCellidentif )
        return tab
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
//        view.addSubview(tabelView)
        setupNav()
    
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillAppear(animated)
        print("viewWillDisappear")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
    }
  
    
    
    fileprivate func setupNav () {
    navigationController?.interactivePopGestureRecognizer?.delegate = self

 
        searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "搜索关键字"
        searchBar.frame = CGRect(x: 0, y: 0, width: 375, height: 64)
        searchBar.delegate = self
        view.addSubview(searchBar)
        // 去除背景及上下两条横线
//        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.becomeFirstResponder()
//        self.navigationItem.titleView = searchBar
    }
    
    
    
}


extension HD_TSSearchVC : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.popViewController(animated: false)
    }
}
extension HD_TSSearchVC : UIGestureRecognizerDelegate{
    
    
}
// MARK: - UITableViewDelegate,UITableViewDataSource
extension HD_TSSearchVC : UITableViewDelegate,UITableViewDataSource{
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (models?.count) ?? 0
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: kCellidentif) as! HD_TSShoppingTVCell
//        let model = models![indexPath.row]
//        cell.bookModel = model
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

