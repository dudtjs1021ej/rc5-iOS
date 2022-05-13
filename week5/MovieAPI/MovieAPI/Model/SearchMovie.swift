//
//  SearchMovie.swift
//  MovieAPI
//
//  Created by 임영선 on 2022/05/13.
//

import Foundation

struct SearchMovie: Codable {
  let movieListResult: MovieListResult
}

struct MovieListResult: Codable {
  let movieList: [MovieList]
}

struct MovieList: Codable {
  let movieCd: String
  let movieNm: String
  let genreAlt: String
  let prdtYear: String
}
