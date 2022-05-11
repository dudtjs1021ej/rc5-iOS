//
//  Library.swift
//  LibraryAPI
//
//  Created by 임영선 on 2022/05/11.
//

import Foundation
struct Library: Codable {
  let row: [Row]
}

struct Row: Codable {
  let SIGUN_NM: String
  let SIGUN_CD: String
  let LIBRARY_NM: String
}
