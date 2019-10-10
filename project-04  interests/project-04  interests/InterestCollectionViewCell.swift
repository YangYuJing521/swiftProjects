//
//  InterestCollectionViewCell.swift
//  project-04  interests
//
//  Created by 杨玉京 on 2019/10/9.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var interest: Interest! {
        didSet{
            updateUi()
        }
    }

    fileprivate func updateUi() {
        titleLabel.text = interest.title
        iconImage.image = interest.featuredImage
    }
    
    // MARK: - refactor layout
    override func layoutSubviews() {
      super.layoutSubviews()
      
      self.layer.cornerRadius = 8.0
      self.clipsToBounds = true
    }

    
}
