//
//  MovieResponse.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}
