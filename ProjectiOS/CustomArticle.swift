//
//  Post.swift
//  ProjectiOS
//
//  Created by Kshitiz on 10/12/22.
//

import Foundation

struct CustomArticle: Codable{
    let title: String
    let description: String
    let user_id: String
    let date_created: Date
    
 
}

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}

