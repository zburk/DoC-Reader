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
                NavigationView {
                    ScrollView {
                        ForEach(posts) { post in
                            NavigationLink(destination: PostSingleView(post: post)) {
                                PostListSingleView(
                                    title: post.title.rendered,
                                    excerpt: post.excerpt.rendered
                                )
                                .background(Color("grayLightest"))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationBarHidden(true)
                }
            }
        }.background(Color(.systemGray6))
    }
}

struct ContentView_Previews: PreviewProvider {
    static let posts = Post.samplePosts
    
    static var previews: some View {
        Group {
            ContentView(posts: .constant(posts))
                .environment(\.colorScheme, .light)
            
            ContentView(posts: .constant(posts))
                .environment(\.colorScheme, .dark)
        }
    }
}
