//
//  ContentView.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import SwiftUI

struct ContentView: View {
    @State var posts = [Post]()

    func loadPosts() -> Void {
        APIClient().request(url: .allPosts) { loadedPosts in
            posts = loadedPosts
        }
    }

    var body: some View {
        Group {
            if (posts.count == 0) {
                Text("No posts found")
            } else {
                List(posts) { post in
                    VStack {
                        Text(post.title.rendered)
                        Text(post.excerpt.rendered)
                    }
                }
            }
        }
        .onAppear(perform: loadPosts)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
