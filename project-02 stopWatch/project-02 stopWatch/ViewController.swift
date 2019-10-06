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
    fileprivate let lepStopWatch: stopwatch = stopwatch()  //初始化空的对象
    fileprivate let startStopWatch: stopwatch = stopwatch()

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
        lapButton.isEnabled = false;
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
        lapButton.isEnabled = true
        chageButton(lapButton, title: "lap", titleColor: UIColor.black)
        
        if isPlay {
            lepStopWatch.timer.invalidate()
            startStopWatch.timer.invalidate()
            chageButton(startButton, title: "start", titleColor: UIColor.green)
            chageButton(lapButton, title: "reset", titleColor: UIColor.black)
            isPlay = false
        }else{
            unowned let weakSelf = self
            startStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(updateMainTimer), userInfo: nil, repeats: true)
            lepStopWatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(updateLapTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(startStopWatch.timer, forMode: RunLoop.Mode.common)
            RunLoop.current.add(lepStopWatch.timer, forMode: RunLoop.Mode.common)
            chageButton(startButton, title: "stop", titleColor: UIColor.red)
            isPlay = true
        }
    }
    
    // MARK: -Private Helper
    fileprivate func chageButton (_ button: UIButton, title: String, titleColor: UIColor){
        button.setTitle(title, for: UIControl.State())
        button.setTitleColor(titleColor, for: UIControl.State())
    }
    
    @objc func updateMainTimer(){   //@objc func
        updateTimer(startStopWatch, label: MainClockLabel)
    }
    
    @objc func updateLapTimer(){
        updateTimer(lepStopWatch, label: SubsidiaryClock)
    }

    
    func updateTimer(_ stopwatch: stopwatch, label: UILabel) {
      stopwatch.counter = stopwatch.counter + 0.035
      
      var minutes: String = "\((Int)(stopwatch.counter / 60))"  //int转为字符串
      if (Int)(stopwatch.counter / 60) < 10 {  //强转
        minutes = "0\((Int)(stopwatch.counter / 60))"   //字符串和int拼接
      }
      
      var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))  //字符串拼接
      if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 { //double的一个算法
        seconds = "0" + seconds
      }
      
      label.text = minutes + ":" + seconds  //字符串运算
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
