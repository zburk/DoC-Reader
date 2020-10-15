//
//  APIClient.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import Foundation

class APIClient {
    let session = URLSession.shared

    static let scheme = "https"
    static let host = "doctorofcredit.com"
    static let baseUrl = "\(APIClient.scheme)://www.\(APIClient.host)"

    enum requests: String {
        case allPosts = "/wp-json/wp/v2/posts"
    }

    public func request<T: Codable>(url: requests, completionHandler: @escaping (T) -> Void) -> Void {
        let requestURL = URL(string: APIClient.baseUrl + url.rawValue)!

        urlSessionRequest(url: requestURL, completionHandler: completionHandler)
    }

    public func request<T: Codable>(url: URL, completionHandler: @escaping (T) -> Void) -> Void {
        urlSessionRequest(url: url, completionHandler: completionHandler)
    }

    private func urlSessionRequest<T: Codable>(url: URL, completionHandler: @escaping (T) -> Void) -> Void {
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            let decoder = JSONDecoder()

            if (data != nil) {
                let decodedData = try! decoder.decode(T.self, from: data!)

                completionHandler(decodedData)
            }
        })
        
        task.resume()
    }
}
