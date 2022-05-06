//
//  MainViewController.swift
//  CarrotFarmGame
//
//  Created by 임영선 on 2022/05/04.
//

import UIKit
import AVFoundation
import Gifu

enum Tool {
  case wateringCan // 물뿌리개
  case pill // 알약
  case hammer //망치
  case none // 선택하징 않음
}

enum Level {
  case level0 // 아무것도 아닌 상태
  case level1 // 씨앗만 뿌린 상태
  case level2 // 물을 1번 줘서 싹이 자란 상태
  case level3 // 당근이 자란 상태
  case done // 다 자라서 수확이 가능한 상태
}

class MainViewController: UIViewController {

  // MARK: Properties
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  
  @IBOutlet var cropsButtons: [UIButton]!
  
  @IBOutlet var growthImageViews1: [UIImageView]!
  @IBOutlet var growthImageViews2: [UIImageView]!
  @IBOutlet var moleImageViews: [GIFImageView]!
  
  @IBOutlet weak var waterCanButton: UIButton!
  @IBOutlet weak var pillButton: UIButton!
  @IBOutlet weak var hammerButton: UIButton!
  
  var score: Int = 0
  var levels: [Level] = [] // 각 작물들의 성장 레벨
  var waterings: [[Bool]] = [] // 1단계, 2단계에서 물을 줬는지 체크
  var toolMode: Tool = .none // 현재 선택된 도구
  var timer: Timer = Timer()
  var time: Int = 1000 // 시작 시간
  var moles: [Bool] = [] // 두더지 있는지 체크
  
  
  var avPlayer = AVPlayer()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    timeLabel.text = String(time)
    createTimer()
    
    //playBGM()
    createMole()
    //checkMole()
    
    // 각 작물들의 성장 단계
    for _ in 0..<12 {
      levels.append(.level0) // 0단계로 초기화
      waterings.append([false, false]) // 1단계, 2단계에서 물 안준걸로 초기화
    }
    
    for _ in 0..<12 {
      moles.append(false)
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
  
  // 타이머 생성 메소드
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
  
  // 작물 클릭했을 떄 처리
  @objc private func clickedCrops(_ sender: UIButton) {
   
    guard let index = cropsButtons.firstIndex(of: sender) else { return }
    let growthImageView1 = growthImageViews1[index]
    let growthImageView2 = growthImageViews2[index]
    
    // 수확할 수 있는 상태이면
    if levels[index] == .done {
      harvest(imageView: growthImageView2, index: index)
    }
    
    switch toolMode {
    // 물뿌리개 선택했을 때
    case .wateringCan:
      // 레벨1이고 물을 주지 않은 상태면
      if levels[index] == .level1, waterings[index][0] == false {
        level1toLevel2(imageView: growthImageView1, index: index) // level2로 성장
        waterings[index][0] = true // level1에서 물 준걸로 체크
      }
      
      // 레벨2이고 물을 주지 않은 상태면
      if levels[index] == .level2, waterings[index][1] == false {
        growthImageView1.image = .none
        level2toLevel3(imageView: growthImageView2, index: index) // level3으로 성장
        waterings[index][1] = true // level2에서 물 준걸로 체크
      }
      
    // 알약을 선택했을 때
    case .pill:
      if levels[index] == .level0 {
        growthImageView1.image = UIImage(named: "level1") // 씨앗 뿌려줌
      }
      levels[index] = .level1 // level1로 성장
      
    // 망치 선택했을 때
    case .hammer:
      print("hammer")
      if moles[index] == true { //두더지가 있었다면
        print("catchMole")
        catchMole(index: index)
      }
    case .none:
      print("none")
    }
  }

  @objc func clickedPill(_ sender: UIButton) {
    toolMode = .pill
    
    // 선택된 도구 테두리 넣어줌
    sender.layer.borderColor = UIColor.red.cgColor
    waterCanButton.layer.borderColor = UIColor.clear.cgColor
    hammerButton.layer.borderColor = UIColor.clear.cgColor
    
  }
  
  @objc func clickedWateringCan(_ sender: UIButton) {
    toolMode = .wateringCan
    
    // 선택된 도구 테두리 넣어줌
    sender.layer.borderColor = UIColor.red.cgColor
    pillButton.layer.borderColor = UIColor.clear.cgColor
    hammerButton.layer.borderColor = UIColor.clear.cgColor
  }
  
  @objc func clickedHammer(_ sender: UIButton) {
    toolMode = .hammer
    
    // 선택된 도구 테두리 넣어줌
    sender.layer.borderColor = UIColor.red.cgColor
    waterCanButton.layer.borderColor = UIColor.clear.cgColor
    pillButton.layer.borderColor = UIColor.clear.cgColor
  }
  
  // level1 -> level2로 성장 처리
  private func level1toLevel2(imageView: UIImageView, index: Int) {
    DispatchQueue.global().async {
      for i in 1...5 {
        DispatchQueue.main.async {
          imageView.image = UIImage(named: "level2_\(i)") // imageview 바꿔줌
        }
        usleep(1000000)
      }
      self.levels[index] = .level2 // level up
    }
  }
  
  // level2 -> level3로 성장 처리
  private func level2toLevel3(imageView: UIImageView, index: Int) {
    DispatchQueue.global().async {
      for i in 1...3 {
        DispatchQueue.main.async {
          imageView.image = UIImage(named: "level3_\(i)")
        }
        usleep(1000000)
      }
      self.levels[index] = .done // level up
    }
  }
  
  // 당근 수확 처리
  private func harvest(imageView: UIImageView, index: Int) {
    DispatchQueue.global().async {
      self.score += 1
      DispatchQueue.main.async {
        imageView.image = .none
        self.scoreLabel.text = String(self.score) // 점수 update
      }
    }
    levels[index] = .level0 // level0으로 초기화
    waterings[index] = [false, false] // 1단계, 2단계 모두 물 안준걸로 초기화
  }
  
  // 배경 음악 삽입
  private func playBGM() {
    guard let url = Bundle.main.url(forResource: "bgm", withExtension: "mp3") else {
      print("error to get the mp3 file")
      return
    }
    avPlayer = AVPlayer(url: url)
    avPlayer.play()
  }
  
  // 두더지 생성
  private func createMole() {
    DispatchQueue.global().async {
      for _ in 1...50 {
        DispatchQueue.main.async {
          for _ in 0..<1 {
            let randomNum = Int.random(in: 0...11)
            self.moles[randomNum] = true // 두더지 있다고 체크
            print("\(randomNum) : \(self.moles[randomNum])")
            self.moleImageViews[randomNum].animate(withGIFNamed: "mole", loopCount: 1)
            

          }
        }
        usleep(10000000)
      }
    }
    
  
    
  }
  
  private func catchMole(index: Int) {
    DispatchQueue.main.async {
      //self.moleImageViews[index].stopAnimatingGIF()
      self.moleImageViews[index].animate(withGIFNamed: "catch", loopCount: 1)
      self.moles[index] = false // 두더지 없다고 체크
      self.score += 1
      self.scoreLabel.text = String(self.score)
    }
  }
  
}
