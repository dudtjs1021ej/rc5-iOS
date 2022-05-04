//
//  MainViewController.swift
//  CarrotFarmGame
//
//  Created by 임영선 on 2022/05/04.
//

import UIKit

class MainViewController: UIViewController {

  // MARK: Properties
  @IBOutlet weak var timeLabel: UILabel!
  var timer: Timer = Timer()
  var time: Int = 5
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    timeLabel.text = String(time)
    createTimer()
    
  }

  // MARK: - Methods
  private func createTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(fireTimer),
                                     userInfo: nil,
                                     repeats: true)
    DispatchQueue.main.async {
      self.timer.fire()
    }
  }
  @objc private func fireTimer() {
    timeLabel.text = String(time)
    time -= 1
    if time < 0 {
      timer.invalidate() // 타이머 정지
      let vc = EndViewController()
      vc.modalPresentationStyle = .overCurrentContext
      present(vc, animated: false, completion: nil)
    }
  }

}
