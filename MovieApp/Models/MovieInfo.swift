//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Matheus Leite on 24/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation

struct MovieDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int
    let genres: [Genre]
    let backdropPath: String
    let adult: Bool
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
