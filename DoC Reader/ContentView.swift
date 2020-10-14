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
                ScrollView {
                    ForEach(posts) { post in
                        PostListSingleView(title: post.title.rendered, excerpt: post.excerpt.rendered)
                            .background(Color(.white))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        
                        Divider().padding(.vertical, 1.0).background(Color(red: 0.34, green: 0.54, blue: 0.06, opacity: 1.00))
                    }
                }
                .background(Color(.systemGray6))
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
