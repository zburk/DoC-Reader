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
        case slug = "https://www.doctorofcredit.com/wp-json/wp/v2/posts?slug="
    }
    
    public func request(url: requests, completionHandler: @escaping ([Post]) -> Void) -> Void {
        let requestURL = URL(string: url.rawValue)!
        
        let task = session.dataTask(with: requestURL, completionHandler: { data, response, error in
            let decoder = JSONDecoder()
            
            if (data != nil) {
                let allPosts = try! decoder.decode([Post].self, from: data!)
                
                completionHandler(allPosts)
            }
        })
        
        task.resume()
    }
    
    public func loadPostFromSlug(slug: String, completionHandler: @escaping (Post) -> Void) -> Void {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "doctorofcredit.com"
        urlComponents.path = "/wp-json/wp/v2/posts"
        urlComponents.queryItems = [
            URLQueryItem(name: "slug", value: slug)
        ]

        guard let url = urlComponents.url else {
            return
        }

        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            let decoder = JSONDecoder()

            if (data != nil) {
                let allPosts = try! decoder.decode([Post].self, from: data!)
                
                completionHandler(allPosts[0])
            }
        })
        
        task.resume()
    }
}
