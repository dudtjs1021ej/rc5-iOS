//
//  TabManFoodViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/30.
//

import UIKit
import Tabman
import Pageboy

class TabManFoodViewController: TabmanViewController {

  @IBOutlet weak var tabView: UIView!
  var viewControllers: [UIViewController] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabMan()
  }
  
  func setupTabMan() {
    guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "FirstFoodViewController") as? FirstFoodViewController else { return }
    guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondFoodViewController") as? SecondFoodViewController else { return }
    viewControllers.append(firstVC)
    viewControllers.append(secondVC)
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    bar.backgroundView.style = .blur(style: .light)
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    // 버튼 글씨 커스텀
    bar.buttons.customize { (button) in
      button.tintColor = .systemGray4
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
      button.selectedFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    bar.indicator.weight = .custom(value: 2)
    bar.indicator.tintColor = .black
    addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
  }
}


extension TabManFoodViewController: PageboyViewControllerDataSource, TMBarDataSource {
  func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
    return viewControllers.count
  }
  
  func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
    return viewControllers[index]
  }
  
  func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
    return nil
  }
  
  func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
    switch index {
    case 0:
      return TMBarItem(title: "동네 맛집")
    case 1:
      return TMBarItem(title: "겨울 간식")
    default:
      let title = "Page \(index)"
      return TMBarItem(title: title)
    }
  }
  
}
