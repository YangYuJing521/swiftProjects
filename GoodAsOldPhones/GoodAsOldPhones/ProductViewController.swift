//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by 杨玉京 on 2019/10/6.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet var backImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = product?.name;
        if let imagename = product?.fullScreenImageName {
            backImage.image = UIImage(named: imagename);
        }

    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        
        print("add to cart successfully");
    }
    
}
