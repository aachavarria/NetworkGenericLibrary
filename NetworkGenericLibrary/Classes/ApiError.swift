//
//  ApiError.swift
//  NetworkGenericLibrary
//
//  Created by Aaron Chavarría Jiménez on 19/6/21.
//

import Foundation

public enum ApiError: Error {
    case requestFailed(description: String)
    case jsonConversionFailure(description: String)
    case invalidData
    case responseUnsuccessful(description: String)
    case jsonParsingFailure
    case noInternet
    case failedSerialization
}
