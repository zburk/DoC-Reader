//
//  ContentView.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var posts: [Post]

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
    }
}

struct ContentView_Previews: PreviewProvider {
    static let posts = Post.samplePosts

    static var previews: some View {
        ContentView(posts: .constant(posts))
    }
}
