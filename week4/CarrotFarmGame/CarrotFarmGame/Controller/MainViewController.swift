//
//  MainViewController.swift
//  CarrotFarmGame
//
//  Created by 임영선 on 2022/05/04.
//

import UIKit

enum Tool {
  case wateringCan
  case pill
  case hammer
  case none
}

class MainViewController: UIViewController {

  // MARK: Properties
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet var cropsButtons: [UIButton]!
  @IBOutlet weak var waterCanButton: UIButton!
  @IBOutlet weak var pillButton: UIButton!
  @IBOutlet weak var hammerButton: UIButton!
  
  
  var toolMode: Tool = .none
  var timer: Timer = Timer()
  var time: Int = 1000
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    timeLabel.text = String(time)
    createTimer()
    
    for button in cropsButtons {
      button.layer.cornerRadius = 30
      button.addTarget(self, action: #selector(clcikedCrops), for: .touchUpInside)
    }
    
    waterCanButton.layer.cornerRadius = 40
    waterCanButton.layer.borderWidth = 2
    waterCanButton.layer.borderColor = UIColor.clear.cgColor
    waterCanButton.addTarget(self, action: #selector(clickedWateringCan), for: .touchUpInside)
    
    pillButton.layer.cornerRadius = 30
    pillButton.layer.borderWidth = 2
    pillButton.layer.borderColor = UIColor.clear.cgColor
    pillButton.addTarget(self, action: #selector(clickedPill), for: .touchUpInside)
    
    hammerButton.layer.cornerRadius = 30
    hammerButton.layer.borderWidth = 2
    hammerButton.layer.borderColor = UIColor.clear.cgColor
    hammerButton.addTarget(self, action: #selector(clickedHammer), for: .touchUpInside)
    
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
  @objc private func clcikedCrops(_ sender: UIButton) {
    print("clicked")
  }

  @objc func clickedPill(_ sender: UIButton) {
    toolMode = .pill
    sender.layer.borderColor = UIColor.red.cgColor
    waterCanButton.layer.borderColor = UIColor.clear.cgColor
    hammerButton.layer.borderColor = UIColor.clear.cgColor
    
  }
  
  @objc func clickedWateringCan(_ sender: UIButton) {
    toolMode = .wateringCan
    sender.layer.borderColor = UIColor.red.cgColor
    pillButton.layer.borderColor = UIColor.clear.cgColor
    hammerButton.layer.borderColor = UIColor.clear.cgColor
  }
  
  @objc func clickedHammer(_ sender: UIButton) {
    toolMode = .hammer
    sender.layer.borderColor = UIColor.red.cgColor
    waterCanButton.layer.borderColor = UIColor.clear.cgColor
    pillButton.layer.borderColor = UIColor.clear.cgColor
  }
  
}
