//
//  NetworkGeneric.swift
//  NetworkGenericLibrary
//
//  Created by Aaron Chavarría Jiménez on 19/6/21.
//

import Foundation

//(Result<T, ApiError>) -> Void)

protocol NetworkGeneric {
    var session: URLSession { get }
    
    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T, ApiError>) -> Void)
    func fetch(with request: URLRequest, completion: @escaping (Result<String, ApiError>) -> Void)
}

extension NetworkGeneric {
    
    private func decodingTask<T: Decodable>(with request: URLRequest, complete:@escaping (Result<T, ApiError>) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request) {data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                complete(.failure(.requestFailed(description: error.debugDescription)))
                return
            }
            
            guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300  else {
                complete(.failure(.responseUnsuccessful(description: "status code = \(httpResponse.statusCode)")))
                return
            }
            
            guard let data = data else {
                complete(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let genericModel = try decoder.decode(T.self, from: data)
                complete(.success(genericModel))
            }catch let error {
                complete(.failure(.jsonConversionFailure(description: error.localizedDescription)))
            }
        }
        return task
    }
    
    private func decodingTask(with request: URLRequest, complete:@escaping (Result<String, ApiError>) -> Void) -> URLSessionDataTask {
        let task = session.dataTask(with: request) {data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                complete(.failure(.requestFailed(description: error.debugDescription)))
                return
            }
            
            guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300  else {
                complete(.failure(.responseUnsuccessful(description: "status code = \(httpResponse.statusCode)")))
                return
            }
            if let error = error {
                complete(.failure(.jsonConversionFailure(description: error.localizedDescription)))
                return
            } else {
                let success = "Item Deleted."
                complete(.success(success))
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, completion: @escaping (Result<T, ApiError>) -> Void) {
        let task = decodingTask(with: request) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }
    func fetch(with request: URLRequest, completion: @escaping (Result<String, ApiError>) -> Void) {
        let task = decodingTask(with: request) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        task.resume()
    }
}
