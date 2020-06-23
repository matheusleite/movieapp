//
//  MovieNetwork.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation

class MovieNetwork {
    
    public static let shared = MovieNetwork()
    private init() {}
    let session = URLSession.shared
    let url = URL(string: "https://api.themoviedb.org/3")!
    let apiKey = "e9a62a938b8dba14e6d15217b853067b"
    let jsonDecoder: JSONDecoder = {
       let jsonDecoder = JSONDecoder()
       jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-mm-dd"
       jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
       return jsonDecoder
    }()
    
    public enum NetworkError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
     
        session.task(with: url) { (result) in
            switch result {
                case .success(let (response, data)):
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    do {
                        let values = try self.jsonDecoder.decode(T.self, from: data)
                        completion(.success(values))
                    } catch {
                        completion(.failure(.decodeError))
                    }
            case .failure( _):
                    completion(.failure(.apiError))
                }
         }.resume()
    }
    
    public func getMovies(endpoint: String, result: @escaping (Result<MoviesResponse, NetworkError>) -> Void) {
        let movieURL = url.appendingPathComponent(endpoint)
        fetchResources(url: movieURL, completion: result)
    }
}
