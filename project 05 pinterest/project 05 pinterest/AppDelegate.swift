//
//  AppDelegate.swift
//  project 05 pinterest
//
//  Created by 杨玉京 on 2019/10/10.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PhotoStreamViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

