//
//  UIColor+Extension.swift
//  project -03 facebookMe
//
//  Created by 杨玉京 on 2019/10/9.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

public extension UIColor{
    
    /*
    convenience:便利，使用convenience修饰的构造函数叫做便利构造函数
    便利构造函数通常用在对系统的类进行构造函数的扩充时使用。
    便利构造函数的特点：
    1、便利构造函数通常都是写在extension里面
    2、便利函数init前面需要加载convenience
    3、在便利构造函数中需要明确的调用self.init()
    */
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
    }
    
    convenience init(hex: Int){
        self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
    }
}
