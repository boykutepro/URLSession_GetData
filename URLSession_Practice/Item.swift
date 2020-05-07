//
//  Item.swift
//  URLSession_Practice
//
//  Created by Thien Tung on 4/27/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import Foundation

struct Item: Codable {
    var title: String
    var tags: [String]
    var answer_count: Int
    var score: Int
    var link: String
}

struct Items: Codable {
    var items: [Item]
}
