
//
//  UIView.swift
//  滚动标题
//
//  Created by 朱明付 on 16/12/6.
//  Copyright © 2016年 朱明付. All rights reserved.
//

import UIKit

extension UIView{
    
    
    func DDsize() -> CGSize {
        return self.frame.size
    }
    
    func DD_width() -> CGFloat {
        return self.frame.size.width
    }
    func DD_height() -> CGFloat {
        return self.frame.size.height
    }
    
    func DD_x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func DD_y() -> CGFloat {
        return self.frame.origin.y
    }

    func DD_centerx() -> CGFloat {
        return self.center.x
    }
    func DD_centery() -> CGFloat {
        return self.center.y
    }

    func DD_bottom() -> CGFloat {
        return self.frame.maxY
    }


}
