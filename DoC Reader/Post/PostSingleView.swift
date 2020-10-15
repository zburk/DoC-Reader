//
//  PostSingleView.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/15/20.
//

import SwiftUI

struct PostSingleView: View {
    @State var post: Post

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title.rendered)
                .font(.title)

            WebViewFromHTML(html: post.content.rendered, redirect: { url in
                self.post = Post.samplePosts[0]
            })
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostSingleView_Previews: PreviewProvider {
    static let post = Post.samplePosts[0]

    static var previews: some View {
        PostSingleView(post: post)
    }
}
