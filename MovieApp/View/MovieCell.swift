//
//  MovieCell.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MovieCell: View {
    
    @State var show = false
    var movie : Movie
    
    var body: some View {
        HStack {
            KFImage(URL(string: "http://image.tmdb.org/t/p/w185\(movie.backdropPath)")!)
                .cornerRadius(10)
            Text(movie.title)
        }.padding(10)
        .onTapGesture {
            self.show.toggle()
        }
        .sheet(isPresented: $show) {
            MovieDetail(movie: self.movie)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(id: 1, title: "Star Wars", overview: "", releaseDate: Date(), voteAverage: 0.0, voteCount: 1, genreIds: [0], backdropPath: "", adult: false))
    }
}
