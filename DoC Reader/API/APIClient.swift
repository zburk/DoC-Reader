//
//  APIClient.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import Foundation

class APIClient {
    let session = URLSession.shared

    enum requests: String {
        case allPosts = "https://www.doctorofcredit.com/wp-json/wp/v2/posts"
    }

    public func request(url: requests, completionHandler: @escaping ([Post]) -> Void) -> Void {
        let requestURL = URL(string: url.rawValue)!

        let task = session.dataTask(with: requestURL, completionHandler: { data, response, error in
            let decoder = JSONDecoder()

            if (data != nil) {
                let allPosts = try! decoder.decode([Post].self, from: data!)
                print(allPosts)
                
                completionHandler(allPosts)
            }
        })

        task.resume()
    }
}
