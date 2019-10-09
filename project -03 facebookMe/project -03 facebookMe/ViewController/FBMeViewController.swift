//
//  FBMeViewController.swift
//  project -03 facebookMe
//
//  Created by 杨玉京 on 2019/10/8.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class FBMeViewController: FBMeBaseViewController {
    // MARK: -proporties
    fileprivate let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        //注册cell
        tableView.register(FBMeCell.self, forCellReuseIdentifier: FBMeCell.identifier)
        return tableView
    }()
//    fileprivate let tableView: UITableView = UITableView()
    
    fileprivate var user: FMUser {
        get {
            return FMUser(name: "BayMax", education: "CMU")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        //set layout for tableview
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
    }
}

extension FBMeViewController{
        
}

// MARK: -tableview datasource

extension FBMeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
}

// MARK: -tableview delegate
extension FBMeViewController: UITableViewDelegate{
    
}
