//
//  UIColor+Extention.swift
//  HouDaAnalysis
//
//  Created by 波 on 2017/11/1.
//  Copyright © 2017年 厚大经分. All rights reserved.
//


import UIKit
// MARK: - 颜色
public extension UIColor{
    
   public convenience init(_ hex:Int, _ alpha:CGFloat = 1){
        self.init(red: CGFloat(((hex & 0xFF0000) >> 16))/255.0, green: CGFloat(((hex & 0xFF00) >> 8))/255.0, blue: CGFloat(((hex & 0xFF)))/255.0, alpha: alpha)
    }
    // rgb 为 0-255 的浮点数
    public convenience init(r :CGFloat, g :CGFloat, b :CGFloat, a :CGFloat = 1){
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    public func getRGB() -> (CGFloat, CGFloat, CGFloat) {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        return (red * 255, green * 255, blue * 255)
    }
    public class var randomColor: UIColor {
       
        let red = CGFloat(arc4random()%256)
        let green = CGFloat(arc4random()%256)
        let blue = CGFloat(arc4random()%256)
        return UIColor(r: red, g: green, b: blue)
        
    }
    
    public class var main: UIColor {
        
        return UIColor(0x1CA3FC)
        
    }
    public class var mainBg: UIColor {
        
        return UIColor(r: 247, g: 247, b: 247)
        
    }
    
   public class var lightMain: UIColor {
        
        return UIColor(0xffb900)
        
    }
    
    
   public class var mainViewBG: UIColor {
        
        return UIColor(0xf6f6f6)
        
    }
    
    
    public class var mainLine: UIColor {
        
        return UIColor(0xececec)
        
    }
    
}

