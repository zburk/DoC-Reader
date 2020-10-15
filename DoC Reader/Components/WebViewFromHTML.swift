//
//  WebView.swift
//  DoC Reader
//
//  Created by Zachary Joseph Shyi-An Burk on 10/15/20.
//

import Foundation
import SwiftUI
import WebKit

struct WebViewFromHTML: UIViewRepresentable {
    var html: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let wkWebView = WKWebView()
        wkWebView.navigationDelegate = context.coordinator
        
        let css = """
            <style>
                body {
                    font-size: 2.5rem;
                    font-family: '-apple-system','HelveticaNeue';
                }
            </style>
        """
        wkWebView.loadHTMLString(css + html, baseURL: nil)
        return wkWebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebViewFromHTML

        init(_ parent: WebViewFromHTML) {
            self.parent = parent
        }
    }
}
