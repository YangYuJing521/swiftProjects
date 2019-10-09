//
//  FBMeCell.swift
//  project -03 facebookMe
//
//  Created by 杨玉京 on 2019/10/8.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class FBMeCell: UITableViewCell {
    static let identifier = "FBMeBaseCell"  //静态id标识

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
