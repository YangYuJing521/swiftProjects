//
//  Interest.swift
//  project-04  interests
//
//  Created by 杨玉京 on 2019/10/9.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class Interest: NSObject {

    // MARK: - Public API
    var id = ""
    var title = ""
    var descript = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    
    init(id: String, title: String, descript: String, featuredImage: UIImage!)
    {
      self.id = id
      self.title = title
      self.descript = descript
      self.featuredImage = featuredImage
      numberOfMembers = 1
      numberOfPosts = 1
    }
    
    // MARK: - Private
    
    static func createInterests() -> [Interest]
    {
      return [
        Interest(id: "r1", title: "We Love Traveling Around the World", descript: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r1")!),
        Interest(id: "r2", title: "Romance Stories", descript: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r2")!),
        Interest(id: "r3", title: "iOS Dev", descript: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r3")!),
        Interest(id: "r4", title: "Race", descript: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r4")!),
        Interest(id: "r5", title: "Personal Development", descript: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r5")!),
        Interest(id: "r6", title: "Reading News", descript: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", featuredImage: UIImage(named: "r6")!),
      ]
    }

}
