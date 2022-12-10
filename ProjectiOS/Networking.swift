//
//  Networking.swift
//  ProjectiOS
//
//  Created by Kshitiz on 10/12/22.
//

import Foundation

struct Networking {
    
    let baseURLString = "https://newsapi.org/v2/everything?q=financial&from=2022-04-28&to=2022-04-28&sortBy=popularity&apiKey=4014c2f165674f1b8a5084be33ea2865";
    func fetchRecentArticles(date:String) async throws -> RecentArticles {
        print(date)
        let url = URL(string: "https://newsapi.org/v2/everything?q=financial&from=\(date)&to=\(date)&sortBy=popularity&apiKey=4014c2f165674f1b8a5084be33ea2865")!
        print(url)
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(RecentArticles.self, from: data)
    }

}
