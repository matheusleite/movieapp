//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {

    init() {
        getMovies()
    }

    @Published var isLoading = true
    @Published var movieList = [Movie]() {
        didSet {
            didChange.send(self)
        }
    }

    func getMovies() {
        MovieNetwork.shared.getMovies(endpoint: "/movie/popular") { (result: Result<MoviesResponse, MovieNetwork.NetworkError>) in
            switch result {
                case .success(let movieResponse):
                    
                    DispatchQueue.main.async {
                        self.movieList = movieResponse.results
                        self.isLoading = false
                    }
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
    let didChange = PassthroughSubject<MovieViewModel, Never>()
}
