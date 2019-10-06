//
//  ViewController.swift
//  project-02 stopWatch
//
//  Created by 杨玉京 on 2019/10/6.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: -Variables
    fileprivate var isPlay: Bool = false
    fileprivate var laps: [String] = []
//    fileprivate var laps: [String]?

    // MARK: -UI Components
    @IBOutlet weak var SubsidiaryClock: UILabel!
    @IBOutlet weak var MainClockLabel: UILabel!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var mainTable: UITableView!
    
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //给button设置一些属性
        let initCircleButton: (UIButton) -> Void = { button in
            button.layer.cornerRadius = 0.5*button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        initCircleButton(lapButton)
        initCircleButton(startButton)
        
        mainTable.dataSource = self;
    }

    // MARK: -UI seeting
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }
    
    // MARK: -Actions
    @IBAction func lapButtonTouchd(_ sender: Any) {
    }
    @IBAction func startButtonTouched(_ sender: Any) {
    }
}


// MARK: -Tableview Datasource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "clockCellId"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }

}
