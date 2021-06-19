//
//  Network.swift
//  NetworkGenericLibrary
//
//  Created by Aaron Chavarría Jiménez on 19/6/21.
//

import Foundation

public class Network: NetworkGeneric {
    var session: URLSession
    
    public init(session: URLSession) {
        self.session = session
    }
    
    public func get<T: Decodable>(url: String, type:T.Type, complete: @escaping (Result<T, ApiError>) -> Void) {
        let request = URLRequest(url: URL(string:url)!)
        self.fetch(type: T.self, with: request, completion: complete)
    }
}
