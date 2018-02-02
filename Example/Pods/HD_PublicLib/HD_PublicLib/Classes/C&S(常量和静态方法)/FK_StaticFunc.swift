//
//  JFStaticFunc.swift
//  HouDaAnalysis
//
//  Created by 波 on 2017/11/20.
//  Copyright © 2017年 厚大经分. All rights reserved.
//

import UIKit

//适配iOS11 的滚动 @available(iOS 11.0, *)
public func adaptScrollViewAdjust(_ scrollView :UIScrollView){
    if #available(iOS 11.0, *) {
        scrollView.contentInsetAdjustmentBehavior = .never
    }
}


// MARK: - 适配 ios11的tabelView的section的高度问题
public func adaptTabelViewSectionHeight(_ tableView:UITableView) {
    if #available(iOS 11.0, *) {
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
    }
}


// MARK: - 打印
public func HDlog<T>(_ message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent.components(separatedBy: ".swift").first ?? "未知"
        print("\n************** printStart *******************\n")
        
        print("\(fileName)[\(line)], \(method):\n\(message)")
        
        print("\n************** printEnd *****************\n")
        
    #endif
}
