//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Matheus Leite on 24/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation
import Combine

final class MovieDetailViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var movieInfo = MovieInfo() {
        didSet {
            didChange.send(self)
        }
    }

    func getMovieInfo(movieId: Int) {
        MovieNetwork.shared.getMovieInfo(endpoint: "/movie/\(movieId)") { (result: Result<MovieInfo, MovieNetwork.NetworkError>) in
            switch result {
                case .success(let movieResponse):
                    
                    DispatchQueue.main.async {
                        self.movieInfo = movieResponse
                        self.isLoading = false
                    }
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
    let didChange = PassthroughSubject<MovieDetailViewModel, Never>()
}
