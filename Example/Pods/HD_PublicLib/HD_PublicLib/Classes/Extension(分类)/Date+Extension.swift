//
//  UIView+Extension.swift
//  HouDaAnalysis
//
//  Created by 波 on 2017/11/1.
//  Copyright © 2017年 厚大经分. All rights reserved.
//

import UIKit

extension Date{
      //返回一个作为参数的字符串
     public func toParamStr() -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy:MM:dd"
        let timeStr = fmt.string(from: self)
    
        return timeStr;
    }
    
    
}


