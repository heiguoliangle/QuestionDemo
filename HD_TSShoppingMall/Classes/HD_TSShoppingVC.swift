//
//  HD_TSShoppingMallVC.swift
//  HD_TSShoppingMall_Example
//
//  Created by heiguoliangle on 2018/1/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

import HGL_PageView
import HD_PublicLib

public class HD_TSShoppingVC: UIViewController {
     // MARK: - 属性
    fileprivate var pageView : HGL_PageView!
    fileprivate let adBtnH = 30
    fileprivate let navH = 64 + 20
    fileprivate var allDataDict : [String : [HD_TSShoppingCellModel]] = [:]
    fileprivate var titlesArr : [HD_TSTypeModel]?
    
    
    
    fileprivate var subVCS : [HD_TSShoppingTVC] = []
     // MARK: - 生命周期
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
        
        
        let label = UILabel()
        view.addSubview(label)
        label.text = "厚大欢迎你"
        label.sizeToFit()
        setupNav()
//        label.center = view.center
//         loadTypeList ()
    }
    
 
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("viewWillAppear")
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        print("viewDidAppear")
    }
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("viewWillDisappear")
    }
    
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        print("viewDidDisappear")
    }
    
  
    
    fileprivate func setupNav (){
        
        let searchBtn = UIButton()
        self.navigationItem.titleView = searchBtn
        searchBtn.setTitle("搜索商品", for: UIControlState.normal)
        searchBtn.sizeToFit()
        searchBtn.setTitleColor(UIColor.red, for: UIControlState.normal)
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        searchBtn.addTarget(self, action: #selector(clickSearchBtn), for: UIControlEvents.touchUpInside)

        searchBtn.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        searchBtn.backgroundColor = UIColor.green
        searchBtn.titleLabel?.textAlignment = .right
    }
    
    // MARK: - 设置UI
    fileprivate func setupUI(_ titles : [String],childVC : [HD_TSShoppingTVC]) {
        setupAdBtn()
        setupSegmentListUI(titles,childVC: childVC)
    }
    func setupAdBtn() {
        let adBtn = UIButton()
        adBtn.titleLabel?.textAlignment
            = .justified
        adBtn.setTitle("如何选择图书", for: UIControlState.normal)
        adBtn.frame = CGRect(x: 0, y: navH, width: Int(kScreenW), height: adBtnH)
        adBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        adBtn.backgroundColor = UIColor.red
        adBtn.addTarget(self, action: #selector(clickAd), for: UIControlEvents.touchUpInside)
        view.addSubview(adBtn)
    }
    
    /// 顶部栏及列表
    fileprivate func setupSegmentListUI(_ titles : [String],childVC : [HD_TSShoppingTVC]) {
        
        let titleStyel = HGL_TitleViewStyle()
        titleStyel.titleViewHeight = 50
        titleStyel.titleSize = 14
        titleStyel.isScrollEnable = false
        titleStyel.selectColor = UIColor.green
        
      
        let frame = CGRect(x: 0, y: CGFloat(navH) + CGFloat(adBtnH) , width: view.bounds.size.width, height: view.bounds.size.height - 64 - 100)
        pageView = HGL_PageView(frame:frame , titles: titles, titleStyle: titleStyel, childVCs: childVC, parentVC: self)
        pageView.pageViewDelegate = self
        
        self.view.addSubview(pageView)
    }
    
}
 // MARK: - 网络请求
extension HD_TSShoppingVC{
    fileprivate func loadTypeList (){
        let titles = ["学习包","小包","单本图书"]
        for i in 0..<titles.count {
            let vc = HD_TSShoppingTVC()
            let model = HD_TSShoppingCellModel()
            model.libraryOriginalPrice = "120"
            model.libraryNewPrice  = "330" + "\(i)"
            model.libraryDescription = "这个是描述"
            model.libraryName = "厚大法考学习包"
            model.libraryIconURL = "http://pic4.nipic.com/20091217/3885730_124701000519_2.jpg"
            vc.models = [model]
            vc.view.backgroundColor = UIColor.randomColor()
            subVCS.append(vc)
        }
        setupUI(titles, childVC: subVCS)
    }
    fileprivate func loadTSInfoList (_ index : Int){
        
    }
    
    
}

 // MARK: - 点击title或者滑动
extension HD_TSShoppingVC : HGL_PageViewDelegate{
    public func pageViewGetIndex(_ pageView: HGL_PageView, targtIndex: Int) {
        print("targtIndex" + "\(targtIndex)")
    }
}


// MARK: - 点击方法

extension HD_TSShoppingVC {
  
    @objc fileprivate func clickAd (){
        print("点击了广告按钮")
    }
    
    @objc fileprivate func clickSearchBtn(){
        print("点击了搜索按钮")
        
        let searchVC = HD_TSSearchVC()
        navigationController?.pushViewController(searchVC, animated: false)
        
    }
}

 // MARK: - touchesBegan
extension HD_TSShoppingVC{
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let titles = ["游戏","娱乐","美女","颜色值"]
        var childs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childs.append(vc)
        }
//        pageView.titles = titles
//        pageView.childVCs = childs
    }
}


extension HD_TSShoppingVC {
    func noAvailableFunc() {
        //        let searchView = UISearchBar()
        //        searchView.placeholder = "搜索商品"
        //        self.navigationItem.titleView = searchView
        // 创建searchResultVC
        let searchResultVC = UIViewController()
        // 设置背景颜色为红色
        //        searchResultVC.view.backgroundColor = UIColor.red
        let searchController = UISearchController(searchResultsController: searchResultVC)
        // 设置背景颜色
        searchController.view.backgroundColor = UIColor.purple
        //UIColor (red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
        // 默认为YES,设置开始搜索时背景显示与否
        // searchController.dimsBackgroundDuringPresentation = false
        // 默认为YES,控制搜索时，是否隐藏导航栏
        searchController.hidesNavigationBarDuringPresentation = false
        // 需要进行强引用 searchController
        //        self.searchController = searchController
        self.navigationItem.titleView = searchController.searchBar
        // 搜索框
        let bar = searchController.searchBar
        bar.frame = CGRect(x: 0, y: 100, width: kScreenW, height: 100)
        //        view.addSubview(bar)
        // 样式
        //        bar.barStyle = .default
        bar.barStyle = .blackTranslucent
        bar.barTintColor = UIColor.red
        //        bar.contentMode = UIViewContentMode.scaleToFill
        
        // 去除背景及上下两条横线
        //        bar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        // 设置光标及取消按钮的颜色
        bar.tintColor = UIColor.yellow
        // 设置代理
//        bar.delegate = self
    }
}
