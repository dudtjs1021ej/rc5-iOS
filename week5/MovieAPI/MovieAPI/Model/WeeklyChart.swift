//
//  WeeklyChart.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import Foundation
struct WeeklyChart: Codable {
  let boxOfficeResult: BoxOfficeResult2
}

struct BoxOfficeResult2: Codable {
  let weeklyBoxOfficeList: [WeeklyBoxOfficeList]
}

struct WeeklyBoxOfficeList: Codable {
  let rank: String
  let movieNm: String
  let openDt: String
  let audiAcc: String
  let movieCd: String
  let salesShare: String
}
