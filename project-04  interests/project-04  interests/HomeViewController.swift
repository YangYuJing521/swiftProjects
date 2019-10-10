//
//  HomeViewController.swift
//  project-04  interests
//
//  Created by 杨玉京 on 2019/10/9.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate var interestDatas = Interest.createInterests()
    
    // MARK: -lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
      return .lightContent
    }

}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interestDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Interest Cell", for: indexPath) as! InterestCollectionViewCell
        cell.interest = interestDatas[(indexPath as NSIndexPath).item]
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate{
    
}
