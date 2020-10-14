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
