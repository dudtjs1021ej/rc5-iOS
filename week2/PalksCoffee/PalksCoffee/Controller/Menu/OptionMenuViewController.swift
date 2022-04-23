//
//  OptionMenuViewController.swift
//  PalksCoffee
//
//  Created by 임영선 on 2022/04/22.
//

import UIKit

// MARK: - OptionCountProtocol
protocol OptionCountProtocol {
  func dataSend(optionCount: Int)
}

class OptionMenuViewController: UIViewController {

  // MARK: Properties
  
  @IBOutlet weak var detailView: UIView!
  @IBOutlet weak var optionView: UIView!
  @IBOutlet weak var countLabel: UILabel!
  
  var delegate: OptionCountProtocol?
  
  var count: Int = 1
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    optionView.layer.cornerRadius = 10
    detailView.layer.borderColor = UIColor(named: "lightGrayColor")?.cgColor
    detailView.layer.borderWidth = 1
    detailView.layer.cornerRadius = 10
  }
  
  // MARK: - Methods
  
  @IBAction func clickedCancel(_ sender: Any) {
    dismiss(animated: false)
  }
  
  @IBAction func clickedMinus(_ sender: Any) {
    if count > 1 {
      count -= 1
      countLabel.text = String(count)
    }
  }
  
  @IBAction func clickedPlus(_ sender: Any) {
    count += 1
    countLabel.text = String(count)
  }
  
  @IBAction func ClickedSelect(_ sender: Any) {
    delegate?.dataSend(optionCount: count) // delegate로 선택 옵션 수량 보냄
    print("OptionMenuViewController \(count)")
    dismiss(animated: false)
  }
}
