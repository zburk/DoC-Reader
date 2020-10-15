//
//  Post.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import Foundation

struct Post: Identifiable, Codable {
    public var id: Int
    public var date: String
    public var title: PostTitle
    public var content: PostContent
    public var excerpt: PostExcerpt
    
    static public func fetchAllPosts(completionHandler: @escaping ([Post]) -> Void) -> Void {
        return APIClient().request(url: .allPosts) { (allPosts: [Post]) in
            completionHandler(allPosts)
        }
    }

    static public func fetchPostFromSlug(slug: String, completionHandler: @escaping (Post) -> Void) -> Void {
        var urlComponents = URLComponents()
        urlComponents.scheme = APIClient.scheme
        urlComponents.host = APIClient.host
        urlComponents.path = APIClient.requests.allPosts.rawValue
        urlComponents.queryItems = [
            URLQueryItem(name: "slug", value: slug)
        ]

        guard let url = urlComponents.url else {
            return
        }

        return APIClient().request(url: url) { (allPosts: [Post]) in
            completionHandler(allPosts[0])
        }
    }
}

struct PostTitle: Codable {
    public var rendered: String
}

struct PostContent: Codable {
    public var rendered: String
}

struct PostExcerpt: Codable {
    public var rendered: String
}

extension Post {
    static var samplePosts = loadPreviewData("posts")

    static private func loadPreviewData(_ name: String) -> [Post] {
        let url = Bundle.main.url(forResource: name, withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            let decoder = JSONDecoder()

            let allPosts = try! decoder.decode([Post].self, from: jsonData)
            return allPosts
        }
        catch {
            print(error)
        }

        return [Post]()
    }
}
