//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Matheus Leite on 24/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation

struct MovieInfo: Codable, Identifiable {
    var id: Int = 0
    var title: String = ""
    var overview: String = ""
    var releaseDate: Date = Date()
    var voteAverage: Double = 0.0
    var voteCount: Int = 0
    var runtime: Int = 0
    var genres: [Genre] = [Genre]()
    var backdropPath: String = ""
    var adult: Bool = false
    
    init() {
        
    }
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
