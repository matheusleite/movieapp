//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct MovieDetail: View {
    
    var movie : Movie
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack() {
            if viewModel.isLoading {
                Text("Loading...")
            } else {
                KFImage(URL(string: "http://image.tmdb.org/t/p/w185\(movie.backdropPath)")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                Text(movie.title).bold().font(.largeTitle)
                Spacer()
                Text("\(viewModel.movieInfo.genres[0].name) • \(getYearFromDate()) • " + String(movie.voteAverage)).font(.body)
                List {
                    Text("Overview").font(.body).foregroundColor(.secondary)
                    Text(movie.overview)
                    Divider()
                    Text("Information").bold().font(.title)
                    VStack(alignment: .leading) {
                        Text("Adult")
                        Text(getAdult()).font(.body).foregroundColor(.secondary)
                    }
                    VStack(alignment: .leading) {
                        Text("Duration")
                        Text("\(viewModel.movieInfo.runtime) min").font(.body).foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Genres")
                        Text(getGenres()).font(.body).foregroundColor(.secondary)
                    }
                }
            }
        }.onAppear {
            self.viewModel.getMovieInfo(movieId: self.movie.id)
        }
    }
    
    func getYearFromDate() -> String {
        let year = Calendar.current.component(.year, from: movie.releaseDate)
        return String(year)
    }
    
    func getAdult() -> String {
        if movie.adult {
            return "Explicit"
        } else {
            return "No"
        }
    }
    
    func getGenres() -> String {
        var genres = ""
        for genre in viewModel.movieInfo.genres {
            genres += genre.name + ", "
        }
        return genres
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(id: 1, title: "Star Wars", overview: "overview", releaseDate: Date(), voteAverage: 0.0, voteCount: 1, genreIds: [0], backdropPath: "", adult: false))
    }
}
