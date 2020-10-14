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
                    PostListSingleView(title: post.title.rendered, excerpt: post.excerpt.rendered)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
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
