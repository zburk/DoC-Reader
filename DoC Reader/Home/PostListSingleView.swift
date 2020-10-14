//
//  PostListSingleView.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/14/20.
//

import SwiftUI

struct PostListSingleView: View {
    public var title: String
    public var excerpt: String

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            Text(excerpt)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
    }
}

struct PostListSingleView_Previews: PreviewProvider {
    static let post = Post.samplePosts[0]

    static var previews: some View {
        PostListSingleView(title: post.title.rendered, excerpt: post.excerpt.rendered)
            .previewLayout(.sizeThatFits)
    }
}
