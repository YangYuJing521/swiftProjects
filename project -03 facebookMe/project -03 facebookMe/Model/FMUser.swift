//
//  FMUser.swift
//  project -03 facebookMe
//
//  Created by 杨玉京 on 2019/10/8.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class FMUser {
    var name: String?
    var AvaterString: String?
    var education: String?
    init(name: String, avateurString: String = "bayMax", education: String) {
        self.name = name
        self.AvaterString = avateurString
        self.education = education
    }
}
