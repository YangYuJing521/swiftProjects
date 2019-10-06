//
//  ContactUsViewController.swift
//  GoodAsOldPhones
//
//  Created by 杨玉京 on 2019/10/6.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!  //这里是weak
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
    }

    
    override func viewDidLayoutSubviews() { //会在layoutsubviews之前调用
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            scrollView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom)
        }else{
            scrollView.frame = CGRect(x: 0, y: topLayoutGuide.length, width: view.frame.width, height: view.frame.height-topLayoutGuide.length-bottomLayoutGuide.length)
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 800)
    }
}
