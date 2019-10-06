//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by 杨玉京 on 2019/9/25.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    private var products: [Product]?   //var 声明的可变数组
    private let cellId = "productId";  //let 声明的静态字符串
//    let name = <#value#>
//    var <#name#> = <#value#>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = [Product(name: "2001 wallstreet", cellImage: "image-cell1", fullImage: "phone-fullscreen1"),
                    Product(name: "2003 hellWorld", cellImage: "image-cell2", fullImage: "phone-fullscreen2"),
                    Product(name: "2006 LikedToPlay", cellImage: "image-cell3", fullImage: "phone-fullscreen3"),
                    Product(name: "2009 goToSchool", cellImage: "image-cell4", fullImage: "phone-fullscreen4"),]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            if let cell = sender as? UITableViewCell,
            let indexpath = tableView.indexPath(for: cell),
            let productVC = segue.destination as? ProductViewController{
                productVC.product = products?[indexpath.row]
        }
      }
    }

}

// MARK: -UItableview datasource
extension ProductsTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath);
        guard let products = products else {
            return cell;
        }
        cell.textLabel?.text = products[indexPath.row].name;
        
        if let imageName = products[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName);
        }
        return cell;
    }
    
    
}
