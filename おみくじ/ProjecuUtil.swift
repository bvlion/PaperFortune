//
//  ProjecuUtil.swift
//  おみくじ
//
//  Created by 愛sMac on 2016/05/04.
//  Copyright © 2016年 愛sMac. All rights reserved.
//

import UIKit

// 画面のサイズを取得するだけのstruct
struct ProjectUtil {
    
    // 画面Rect取得
    private static func bounds() -> CGRect {
        return UIScreen.mainScreen().bounds
    }
    
    // 横幅取得
    static func screenWidth() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    // 縦幅取得
    static func screenHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
}