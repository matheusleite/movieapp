//
//  Movie.swift
//  MovieApp
//
//  Created by Matheus Leite on 19/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let voteCount: Int
    let adult: Bool
}
