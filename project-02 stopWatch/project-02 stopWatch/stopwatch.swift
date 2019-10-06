//
//  stopwatch.swift
//  project-02 stopWatch
//
//  Created by 杨玉京 on 2019/10/6.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class stopwatch: NSObject {

    var counter: Double
    var timer: Timer
    
    override init () {
        self.counter = 0.0;
        self.timer = Timer()
    }
    
}
