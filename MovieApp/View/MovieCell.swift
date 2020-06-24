//
//  MovieCell.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    
    var movie : Movie
    
    var body: some View {
        VStack {
            Text(movie.title)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(id: 1, title: "Star Wars", overview: "", releaseDate: Date(), voteAverage: 0.0, voteCount: 1, adult: false))
    }
}
