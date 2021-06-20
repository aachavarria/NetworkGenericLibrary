//
//  Post.swift
//  NetworkGenericLibrary_Example
//
//  Created by Aaron Chavarría Jiménez on 19/6/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int?
    var title: String
    var body: String
}
