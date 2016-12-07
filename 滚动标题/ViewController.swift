//
//  ViewController.swift
//  滚动标题
//
//  Created by 朱明付 on 16/12/6.
//  Copyright © 2016年 朱明付. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let titlesbtn = ["直播","推荐","番剧"]
    let contVC = [UIViewController(),UIViewController(),UIViewController()]
    
    fileprivate lazy var titleView : TheTitleView = {
        
        let Rect = CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH)
        let mtview = TheTitleView(frame: Rect, titles: self.titlesbtn, controllerVC: self.contVC)
        
        return mtview
    }()

 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = titleView
        self.navigationItem.titleView = titleView.titleView
        
        
    }
}

