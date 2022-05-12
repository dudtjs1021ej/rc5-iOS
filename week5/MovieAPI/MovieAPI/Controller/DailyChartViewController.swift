//
//  DayChartViewController.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import UIKit
import Alamofire

class DailyChartViewController: UIViewController {

  @IBOutlet weak var dailyMovieCollectionView: UICollectionView!

  var dailyBoxOfficeList: [DailyBoxOfficeList] = []
  override func viewDidLoad() {
    super.viewDidLoad()
    getDailyMovie()
    dailyMovieCollectionView.dataSource = self
   
  }
  
  private func getDailyMovie() {
    var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=66fe30704179395a87cdaa98664e6a63&targetDt="
    url += getYesterdayString()
    print(url)
    AF.request(url).responseJSON { (response) in
      switch response.result {
      case.success(let data):
        do {
          let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
          let json = try JSONDecoder().decode(DailyChart.self, from: jsonData)
          self.dailyBoxOfficeList = json.boxOfficeResult.dailyBoxOfficeList
          print(self.dailyBoxOfficeList)
         
          // collectionView reloadData
          DispatchQueue.main.async {
            self.dailyMovieCollectionView.reloadData()
          }
        } catch(let error) {
          print(error.localizedDescription)
        }
      case .failure(let error):
        print("failure \(error.localizedDescription)")
      }
    }
  }
  
  private func getYesterdayString() -> String {
    guard let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else { return "" }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYYMMdd"
    let str = dateFormatter.string(from: yesterDay)
    return str
  }
}

extension DailyChartViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dailyBoxOfficeList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = dailyMovieCollectionView.dequeueReusableCell(withReuseIdentifier: "dailyChartCell", for: indexPath)
            as? DailyChartCollectionViewCell else { return UICollectionViewCell() }
    cell.audiAccLabel.text = "누적 \(dailyBoxOfficeList[indexPath.row].audiAcc)명"
    cell.titleLabel.text = dailyBoxOfficeList[indexPath.row].movieNm
    cell.rankLabel.text = dailyBoxOfficeList[indexPath.row].rank
    cell.salesLabel.text = "\(dailyBoxOfficeList[indexPath.row].salesShare)%"
    cell.posterImageView.layer.cornerRadius = 10
    cell.posterImageView.image = UIImage(named: dailyBoxOfficeList[indexPath.row].movieCd)
    return cell
    
  }
  
  
}
