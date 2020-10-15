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
    var redirect: (_ url: String) -> Void
    
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
        let css = """
            <style>
                body {
                    font-size: 2.5rem;
                    font-family: '-apple-system','HelveticaNeue';
                }
            </style>
        """
        uiView.loadHTMLString(css + html, baseURL: nil)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebViewFromHTML

        init(_ parent: WebViewFromHTML) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let newUrl = navigationAction.request.url?.absoluteURL.absoluteString {
                if (newUrl == "about:blank" || !newUrl.contains("doctorofcredit.com")) {
                    return decisionHandler(.allow)
                }
                self.parent.redirect(newUrl)
                return decisionHandler(.cancel)
            }
            return decisionHandler(.allow)
        }
    }
}
