//
//  MovieChartViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit
import Tabman
import Pageboy

class MovieChartViewController: TabmanViewController {
  @IBOutlet weak var tabView: UIView!
  private var viewControllers: [UIViewController] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabMan()
    isScrollEnabled = false

  }
    

  func setTabMan() {
    guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "dayChartVC")
            as? DailyChartViewController else { return }
    guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "weekChartVC")
            as? WeeklyChartViewController else { return }
    viewControllers.append(firstVC)
    viewControllers.append(secondVC)
    
    self.dataSource = self
    
    let bar = TMBar.ButtonBar()
    
    bar.backgroundView.style = .blur(style: .light)
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    bar.buttons.customize { button in
      button.tintColor = .systemGray4
      button.selectedTintColor = .black
      button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    bar.indicator.weight = .custom(value: 2)
    bar.indicator.tintColor = .black
    addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
  }

}



extension MovieChartViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
      return TMBarItem(title: "일별 차트")
    case 1:
      return TMBarItem(title: "주간 차트")
    default:
      return TMBarItem(title: "page \(index)")
    }
  }
}
