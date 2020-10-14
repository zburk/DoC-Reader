//
//  DoC_ReaderApp.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import SwiftUI

@main
struct DoC_ReaderApp: App {
    @State private var posts = [Post]()

    func loadPosts() -> Void {
        APIClient().request(url: .allPosts) { loadedPosts in
            posts = loadedPosts
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView(posts: $posts)
        }
    }
}
