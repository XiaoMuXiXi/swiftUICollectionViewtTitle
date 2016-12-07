//
//  TheTitleView.swift
//  滚动标题
//
//  Created by 朱明付 on 16/12/6.
//  Copyright © 2016年 朱明付. All rights reserved.
//

import UIKit

class TheTitleView: UIView {

    /// 懒加载属性
    var selectBtn = UIButton()
    var indicate = UIView()
    
    var titlesBtlable : [String] = {
        let titles = [String]()
        return titles
    }()
     var viewVC = [UIViewController]()
    
      lazy var titleView : UIView = {
       
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 300, height: 40)
        
        
        return titleView
    }()
    
    lazy var collectionView : UICollectionView = {
        let Layout = UICollectionViewFlowLayout()
        Layout.itemSize = CGSize(width: ScreenW, height: ScreenH)
        Layout.minimumLineSpacing = 0
        Layout.minimumInteritemSpacing = 0
        Layout.scrollDirection = .horizontal
        
        Layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let frame = CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH)
        let collection = UICollectionView(frame: frame, collectionViewLayout: Layout)
        collection.isPagingEnabled = true
        //设置属性
        //设置背景颜色
        collection.backgroundColor = UIColor.red
        //设置代理方法
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
     init(frame: CGRect,titles : [String] ,controllerVC : [UIViewController]) {
        
        self.titlesBtlable = titles
        self.viewVC = controllerVC
        super.init(frame: frame)
        setTitleBtn()
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TheTitleView {
    
    func setupUI() {
        
        addSubview(collectionView)
        register()
    }
    func register()  {
        collectionView .register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
    }
}
extension TheTitleView {
    
    func setTitleBtn () {
        /// 获取titleBtn 的X
        /// 获取titleBtn 的W
        
        let titleW : CGFloat = titleView.DD_width()/CGFloat(self.titlesBtlable.count)
        let titleH : CGFloat = titleView.DD_height()
        for i in 0..<self.titlesBtlable.count {
            let titleBtn = UIButton(type: .custom)
            /// 设置tag值
            titleBtn.tag = i
            // 设置titleBtn属性
            /// 给按钮添加点击放
        titleBtn .addTarget(self, action: #selector(titleLabelClick(_:)), for: .touchUpInside)
            titleBtn .setTitle(self.titlesBtlable[i], for: .normal)
            titleBtn.frame = CGRect(x: titleW * CGFloat(i), y: 0, width: titleW, height: titleH)
            titleView .addSubview(titleBtn)
            titleBtn .setTitleColor(UIColor.black, for: .normal)
            titleBtn .setTitleColor(UIColor.red, for: .selected)
        }
        /// 设置按钮的点击颜色
        var DDbtn = UIButton()
        DDbtn = titleView.subviews.first as! UIButton
        self.selectBtn = DDbtn
        titleLabelClick(selectBtn)
        /// 添加底部滑动条
        let indeicate = UIView()
        indeicate.frame.size.height = 1.5
        indeicate.backgroundColor = self.selectBtn.titleLabel?.textColor
        indeicate.frame.origin.y = 36
        self.indicate = indeicate
        ///  当走到这里时就给indeicate 设置宽高 ,并且设置
        self.selectBtn.titleLabel?.sizeToFit()
        self.indicate.frame.size.width = (self.selectBtn.titleLabel?.frame.size.width)!+10
        self.indicate.center.x = self.selectBtn.center.x
        self.selectBtn.isSelected = true
        titleView .addSubview(indeicate)
        
    }
    func titleLabelClick(_ sender : UIButton){
       self.selectBtn.isSelected = false
        sender.isSelected = true
        self.selectBtn = sender
        /// 设置底部指示器 加个小小的动画
        UIView .animate(withDuration: 0.25) {
            self.indicate.frame.size.width = (sender.titleLabel?.frame.size.width)!+10
            self.indicate.center.x = sender.center.x
            
            
        }
        // 让collectionView滚动到对应位置
        var contentset : CGPoint = collectionView.contentOffset
        
        contentset.x = CGFloat(self.selectBtn.tag) * collectionView.frame.size.width
        collectionView .setContentOffset(contentset, animated: true)
    }
}
extension TheTitleView : UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    /**
     * 在scrollView滚动动画结束时, 就会调用这个方法
     * 前提: 人为拖拽scrollView产生的滚动动画
     */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / collectionView.frame.size.width
        var titleBtn = UIButton()
        titleBtn = self.titleView.subviews[Int(index)] as! UIButton
        titleLabelClick(titleBtn)
    }
    
}
extension TheTitleView : UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
    return self.titlesBtlable.count
    
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath)
        
        /// 如果有需要则想CollectionViewCell中添加Viewcontroller.view即可
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}





