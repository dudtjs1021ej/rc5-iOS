//
//  WeekViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit
import Alamofire

class WeeklyChartViewController: UIViewController {

  @IBOutlet weak var weeklyCollectionView: UICollectionView!
  var weeklyBoxOfficeList: [WeeklyBoxOfficeList] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    weeklyCollectionView.dataSource = self
    getDailyMovie()
  }
  
  private func getDailyMovie() {
    var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=66fe30704179395a87cdaa98664e6a63&weekGb=0&targetDt="
    url += getWeekString()
    print(url)
    AF.request(url).responseJSON { (response) in
      switch response.result {
      case.success(let data):
        do {
          print("getDailyMovie")
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let json = try JSONDecoder().decode(WeeklyChart.self, from: jsonData)
          self.weeklyBoxOfficeList = json.boxOfficeResult.weeklyBoxOfficeList
          print(self.weeklyBoxOfficeList)
         
          // collectionView reloadData
          DispatchQueue.main.async {
            self.weeklyCollectionView.reloadData()
          }
        } catch(let error) {
          print("getDailyMovie \(error.localizedDescription)")
        }
      case .failure(let error):
        print("failure getDailyMovie \(error.localizedDescription)")
      }
    }
  }
  
  private func getWeekString() -> String {
    guard let yesterDay = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYYMMdd"
    let str = dateFormatter.string(from: yesterDay)
    return str
  }
}

extension WeeklyChartViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weeklyBoxOfficeList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = weeklyCollectionView.dequeueReusableCell(withReuseIdentifier: "weeklyChartCell", for: indexPath)
            as? WeeklyChartCollectionViewCell else { return UICollectionViewCell() }
    cell.audiAccLabel.text = "누적 \(weeklyBoxOfficeList[indexPath.row].audiAcc)명"
    cell.titleLabel.text = weeklyBoxOfficeList[indexPath.row].movieNm
    cell.rankLabel.text = weeklyBoxOfficeList[indexPath.row].rank
    cell.salesLabel.text = "\(weeklyBoxOfficeList[indexPath.row].salesShare)%"
    cell.posterImageView.layer.cornerRadius = 10
    if let image = UIImage(named: weeklyBoxOfficeList[indexPath.row].movieCd) {
      cell.posterImageView.image = image
    }
    
    
    
    return cell
    
  }
  
  
}
