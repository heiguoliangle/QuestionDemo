//
//  BaseConst.swift
//  HouDaAnalysis
//
//  Created by 波 on 2017/11/1.
//  Copyright © 2017年 厚大经分. All rights reserved.
//

import UIKit

public let kFirstLaunch = "firstLaunch"
public let kIsLogin = "isLogin"

public let kScreenW = UIScreen.main.bounds.size.width
public let kScreenH = UIScreen.main.bounds.size.height
public let kScreen = UIScreen.main.bounds

public let  GPStatusBarH = UIApplication.shared.statusBarFrame.size.height

// MARK: - 适配iponeX 的64 可能是 88
public let topMagin =  kScreenH == 812.0 ? 88 : 64
// MARK: - 底部的安全区域
public let safeBottom = kScreenH == 812.0 ? 34 : 0
