//
//  File.swift
//  封装滚动标题
//
//  Created by 朱明付 on 16/11/29.
//  Copyright © 2016年 朱明付. All rights reserved.
//

import UIKit



let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height
extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
