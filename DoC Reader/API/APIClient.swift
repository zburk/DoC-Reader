//
//  APIClient.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import Foundation

class APIClient {
    public func request(url: String, completionHandler: @escaping ([Post]) -> Void) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler([
                Post(id: 1, date: Date(), title: PostTitle(rendered: "Test Title"), content: PostContent(rendered: "sdlfkjsdflksd flskdf jsdklf jsdkf s")),
                Post(id: 2, date: Date(), title: PostTitle(rendered: "Test Title2"), content: PostContent(rendered: "aqwerrenglk shfghfgh"))
            ])
        }
    }
}
