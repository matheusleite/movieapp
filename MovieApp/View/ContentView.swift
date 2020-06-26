//
//  ContentView.swift
//  MovieApp
//
//  Created by Matheus Leite on 19/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationView {

            if viewModel.isLoading {
                Text("Loading...")
            } else {
                List(viewModel.movieList){ movie in
                    MovieCell(movie: movie)
                }
                .navigationBarTitle(Text("Trending Movies"))
                    /// removing separators from the list
                    .onAppear(perform: {
                        UITableView.appearance().separatorStyle = .none
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
