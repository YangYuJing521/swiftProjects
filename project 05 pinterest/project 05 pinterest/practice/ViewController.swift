//
//  ViewController.swift
//  project 05 pinterest
//
//  Created by 杨玉京 on 2019/10/10.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counter = Counter()
        counter.incrementBy(amount: 4, numberoftimes: 5)
        print(counter.count)
        
        //元祖的定义获取方法
        let http404 = (404, "NOT FOUND")
        print(http404.0)
        print(http404.1)
        let http404Error = (status: 404, message: "NOT FOUND")
        print(http404Error.status, http404Error.message)
        

        //下划线的用法
        counter.incrementBy(amount: 1, numberoftimes: 1)
        counter.incrementBy(1, 1)
        counter.incrementBy(amount: 1, 1)
        counter.incrementBy(1, numberoftimes: 1)
        
    }


}

