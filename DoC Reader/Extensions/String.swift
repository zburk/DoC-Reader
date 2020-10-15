//
//  String.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/15/20.
//

import Foundation

extension String {
    public func convertHtmlToString() -> String {
        let data = Data(self.utf8)
        if let attributedString = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) {
            return attributedString.string
        }
        return ""
    }
}
