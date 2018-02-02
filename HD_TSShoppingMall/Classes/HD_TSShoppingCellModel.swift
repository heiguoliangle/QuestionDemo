//
//  HD_TSShoppingCellModel.swift
//  HD_TSShoppingMall_Example
//
//  Created by heiguoliangle on 2018/1/31.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class HD_TSShoppingCellModel: NSObject {
    var libraryID : Int?
    var libraryName : String = "2018学习包"
    var libraryDescription : String = "老学员专项"
    var libraryTags : [String]?
    var libraryOriginalPrice : String = "待定"
    var libraryNewPrice : String = "待定"
    var libraryIconURL : String?
    var isAdv : Int = 0
}
