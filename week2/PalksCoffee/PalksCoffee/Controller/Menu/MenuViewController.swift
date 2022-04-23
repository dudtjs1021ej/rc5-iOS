//
//  MunuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

class MenuViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet var menuButtons: [UIButton]!
  @IBOutlet weak var menuView: UIView!
  @IBOutlet weak var coffeeContainerView: UIView!
  @IBOutlet weak var drinkContainerView: UIView!
  
  var selectedIndex = 0
  
  //MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    drinkContainerView.alpha = 0 // 음료 메뉴 투명도 0
    
    for button in menuButtons { // 모든 메뉴버튼에 액션 달아줌
      button.layer.cornerRadius = 20
      button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    let coffeeMenuButton = menuButtons[0] // 커피 메뉴 처음부터 선택되게 설정
    coffeeMenuButton.backgroundColor = UIColor(named: "palkColor")
    coffeeMenuButton.setTitleColor(.white, for: .normal)
    
  }
  
  // MARK: - Methdos
  
  // 선택한 버튼의 background와 textColor만 변하게 설정
  @objc func buttonAction(_ sender: UIButton) {
    for (index, button) in menuButtons.enumerated() {
      if button == sender {
        self.selectedIndex = index
        button.backgroundColor = UIColor(named: "palkColor")
        button.setTitleColor(.white, for: .normal)
      } else {
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
      }
    }
    
    // 선택한 메뉴창만 보이게 설정
    if selectedIndex == 0 {
      drinkContainerView.alpha = 0
      coffeeContainerView.alpha = 1
    }
    else if selectedIndex == 1 {
      drinkContainerView.alpha = 1
      coffeeContainerView.alpha = 0
    }
    else {
      drinkContainerView.alpha = 0
      coffeeContainerView.alpha = 0
    }
  }
  @IBAction func clickedBackButton(_ sender: Any) {
    dismiss(animated: false)
  }
  
}
