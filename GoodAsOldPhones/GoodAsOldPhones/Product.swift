//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by 杨玉京 on 2019/9/25.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit
/**
 *  商品模型
 */

class Product: NSObject {
    var name: String?
    var cellImageName: String?
    var fullScreenImageName: String?
    
    init(name:String, cellImage:String, fullImage:String) {
        self.name = name;
        self.cellImageName = cellImage;
        self.fullScreenImageName = fullImage;
    }
}
