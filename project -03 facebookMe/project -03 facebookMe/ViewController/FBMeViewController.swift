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
    //自定义数据类型，便于阅读
    typealias RowModel = [String: String]
    
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
    
    fileprivate var tableDatas: [[String: Any]]{
        get{
            return TableKeys.populate(withUser: user)
        }
    }

    // MARK: -life Cycle
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
// MARK: -extension
extension FBMeViewController{
    fileprivate func rowsArray(inSection section: Int) -> [[String:Any]]{
        return tableDatas[section][TableKeys.Rows] as! [[String : Any]]
    }
    
    fileprivate func sectionTitle(inSection section: Int) -> String?{//返回值是带？的
        return tableDatas[section][TableKeys.Section] as? String
    }
    
    fileprivate func rowModel(atIndexpath indexpath: IndexPath) -> RowModel{
        return rowsArray(inSection: indexpath.section)[indexpath.row] as! RowModel
    }
}

// MARK: -tableview datasource

extension FBMeViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDatas.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsArray(inSection: section).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let modelForRow = rowModel(atIndexpath: indexPath)
        guard let title = modelForRow[TableKeys.Title] else {
            return cell
        }
        if title == user.name {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: nil)
        }else {
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeCell.identifier, for: indexPath)
        }
        cell.textLabel?.text = modelForRow[TableKeys.Title]
        if let imageName = modelForRow[TableKeys.ImageName] {
            cell.imageView?.image = UIImage(named: imageName)
        }else if title != TableKeys.logout{
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        
        if title == user.name {
          cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        return cell
    }
    
}

// MARK: -tableview delegate
extension FBMeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let modelForRow = rowModel(atIndexpath: indexPath)
        guard let title = modelForRow[TableKeys.Title] else {
          return 0.0
        }
        if title == user.name {
          return 64.0
        } else {
          return 44.0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      let modelForRow = rowModel(atIndexpath: indexPath)
      
      guard let title = modelForRow[TableKeys.Title] else {
        return
      }
      
      if title == TableKeys.seeMore || title == TableKeys.addFavorites {
        cell.textLabel?.textColor = Specs.color.tint
        cell.accessoryType = .none
      } else if title == TableKeys.logout {
        cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
        cell.textLabel?.textColor = Specs.color.red
        cell.textLabel?.textAlignment = .center
        cell.accessoryType = .none
      } else {
        cell.accessoryType = .disclosureIndicator
      }
    }
}
