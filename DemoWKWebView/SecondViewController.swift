//
//  ViewController.swift
//  DemoWKWebView
//
//  Created by 현명 on 2023/06/15.
//

import UIKit
import WebKit

class SecondViewController: UIViewController,
WKUIDelegate, WKNavigationDelegate{

    var webView: WKWebView!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func loadView() {
        //코드로 뷰를 생성하는 경우 사용
        webView = WKWebView(frame: CGRect.zero)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view = self.webView!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let naver = "https://m.daum.net"
        let url = URL(string:naver)
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.frame = CGRect(x: view.frame.midX-50, y: view.frame.midY-50, width: 100, height: 100)
        activityIndicator.color = UIColor.red
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //다시 숨기기
        self.activityIndicator.removeFromSuperview()
    }

}

