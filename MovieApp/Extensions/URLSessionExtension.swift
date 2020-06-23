//
//  URLSessionExtension.swift
//  MovieApp
//
//  Created by Matheus Leite on 23/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import Foundation

extension URLSession {
    func task(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
