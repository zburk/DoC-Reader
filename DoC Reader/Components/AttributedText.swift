//
//  TextWithAttributedString.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/15/20.
//

import SwiftUI

struct AttributedText: UIViewRepresentable {
    var html: String
    var width: CGFloat

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }

    func updateUIView(_ label: UILabel, context: Context) {
        let data = Data(html.utf8)
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            label.attributedText = attributedString
            label.font = UIFont.systemFont(ofSize: 20.0)
            label.preferredMaxLayoutWidth = width
        }
    }
}
