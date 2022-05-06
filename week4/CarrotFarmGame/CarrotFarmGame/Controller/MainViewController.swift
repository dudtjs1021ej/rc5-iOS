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

enum Level {
  case level0
  case level1
  case level2
  case level3
}
class MainViewController: UIViewController {

  // MARK: Properties
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet var cropsButtons: [UIButton]!
  
  @IBOutlet var growthImageViews1: [UIImageView]!
  @IBOutlet var growthImageViews2: [UIImageView]!
  
  @IBOutlet weak var waterCanButton: UIButton!
  @IBOutlet weak var pillButton: UIButton!
  @IBOutlet weak var hammerButton: UIButton!
  
  var levels: [Level] = []
  var waterings: [[Bool]] = []
  var toolMode: Tool = .none
  var timer: Timer = Timer()
  var time: Int = 1000
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    timeLabel.text = String(time)
    createTimer()
    
    // 각 작물들의 성장 단계
    for _ in 0..<12 {
      levels.append(.level0) // 0단계로 초기화
      waterings.append([false, false]) // 1단계, 2단계에서 물 안준걸로 초기화
    }
    
    for button in cropsButtons {
      button.layer.cornerRadius = 30
      button.backgroundColor = .clear
      button.addTarget(self, action: #selector(clickedCrops(_:)), for: .touchUpInside)
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
  
  @objc private func clickedCrops(_ sender: UIButton) {
   
    guard let index = cropsButtons.firstIndex(of: sender) else { return }
    let growthImageView1 = growthImageViews1[index]
    let growthImageView2 = growthImageViews2[index]
    switch toolMode {
      
    // 물뿌리개 선택했을 때
    case .wateringCan:
      if levels[index] == .level1, waterings[index][0] == false {
        level1toLevel2(imageView: growthImageView1, index: index) // level
        waterings[index][0] = true
      }
      
      if levels[index] == .level2, waterings[index][1] == false {
        growthImageView1.image = .none
        level2toLevel3(imageView: growthImageView2)
        waterings[index][1] = true
      }
      
    // 알약을 선택했을 때
    case .pill:
      if levels[index] == .level0 {
        growthImageView1.image = UIImage(named: "level1")
      }
      levels[index] = .level1 // level1로 성장
      
    // 망치 선택했을 때
    case .hammer:
      print("hammer")
    case .none:
      print("none")
    }
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
  
  private func level1toLevel2(imageView: UIImageView, index: Int) {
    DispatchQueue.global().async {
      for i in 1...5 {
        DispatchQueue.main.async {
          imageView.image = UIImage(named: "level2_\(i)")
        }
        usleep(1000000)
      }
      self.levels[index] = .level2
    }
  }
  
  private func level2toLevel3(imageView: UIImageView) {
    DispatchQueue.global().async {
      for i in 1...3 {
        DispatchQueue.main.async {
          imageView.image = UIImage(named: "level3_\(i)")
        }
        usleep(1000000)
      }
    }
  }
}
