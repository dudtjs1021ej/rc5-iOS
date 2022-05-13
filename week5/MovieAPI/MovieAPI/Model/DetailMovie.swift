//
//  DetailMovie.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/13.
//

import Foundation

struct DetailMovie: Codable {
  let movieInfoResult: MovieInfoResult
}

struct MovieInfoResult: Codable {
  let movieInfo: MovieInfo
}


struct MovieInfo: Codable {
  let movieCd: String
  let movieNm: String
  let movieNmEn: String
  let showTm: String
  let prdtYear: String
  let openDt: String
  let genres: [Genre]
  let directors: [Director]
  let actors: [Actor]?
}

struct Genre: Codable {
    let genreNm: String
}

struct Director: Codable {
    let peopleNm: String
}

struct Actor: Codable {
    let peopleNm: String
}
