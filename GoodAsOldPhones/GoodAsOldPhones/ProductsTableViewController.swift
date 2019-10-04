//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 杨玉京 on 2019/9/25.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    private var products: [Product]?
    private let cellId = "productId";
//    let name = <#value#>
//    var <#name#> = <#value#>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [Product(name: "2001 wallstreet", cellImage: "image-cell1", fullImage: "phone-fullscreen1"),
                    Product(name: "2003 hellWorld", cellImage: "image-cell2", fullImage: "phone-fullscreen2"),
                    Product(name: "2006 LikedToPlay", cellImage: "image-cell3", fullImage: "phone-fullscreen3"),
                    Product(name: "2009 goToSchool", cellImage: "image-cell4", fullImage: "phone-fullscreen4"),];
        

    }


}

