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
    @State public var excerptParsed: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color("docGreen"))
                .frame(height: 5)

            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Gift Card Deals")
                        .font(.headline)
                    HStack {
                        Text("Charles")
                            
                        Spacer()
                        Text("3h")
                    }
                }

                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(excerptParsed)

                HStack {
                    Image(systemName: "bubble.left.fill")
                    Text("12 comments")
                        .font(.caption)
                }
            }
            .padding()
            .onAppear {
                let data = Data(excerpt.utf8)
                if let attributedString = try? NSAttributedString(
                    data: data,
                    options: [.documentType: NSAttributedString.DocumentType.html],
                    documentAttributes: nil) {
                    excerptParsed = attributedString.string
                }
            }
        }
    }
}

struct PostListSingleView_Previews: PreviewProvider {
    static let post = Post.samplePosts[0]

    static var previews: some View {
        PostListSingleView(
            title: post.title.rendered,
            excerpt: post.excerpt.rendered
        )
            .previewLayout(.sizeThatFits)
    }
}
