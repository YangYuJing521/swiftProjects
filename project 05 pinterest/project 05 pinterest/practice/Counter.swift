//
//  test.swift
//  project 05 pinterest
//
//  Created by 杨玉京 on 2019/10/10.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class Counter {
    var count: Int = 0;
    func incrementBy(amount: Int, numberoftimes: Int) {
        count += amount * numberoftimes
    }

    func incrementBy(_ amount: Int, numberoftimes: Int) {
        count += amount * numberoftimes
    }
    
    func incrementBy(amount: Int,_ numberoftimes: Int) {
        count += amount * numberoftimes
    }

    func incrementBy(_ amount: Int,_ numberoftimes: Int) {
        count += amount * numberoftimes
    }

}
