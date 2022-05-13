//
//  MovieTheater.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/12.
//

import Foundation

struct Movie: Codable {
  let MovieScreening: [MovieScreening]
}
struct MovieScreening: Codable {
  let row: [Row]?
}

struct Row: Codable {
 let BIZPLC_NM: String?
 let REFINE_WGS84_LOGT: String?
 let REFINE_WGS84_LAT: String?
}
