//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    var movie : Movie
    
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                Text("Overview").font(.body).foregroundColor(.secondary)
                Text(movie.overview)
                Text("Duration").font(.body).foregroundColor(.secondary)
                Text(movie.overview)
            }
            .navigationBarTitle(Text(movie.title), displayMode: .large)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(id: 1, title: "Star Wars", overview: "overview", releaseDate: Date(), voteAverage: 0.0, voteCount: 1, adult: false))
    }
}
