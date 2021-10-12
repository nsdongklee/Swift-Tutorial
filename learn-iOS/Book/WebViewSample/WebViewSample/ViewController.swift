//
//  ViewController.swift
//  WebViewSample
//
//  Created by 이동규 on 2021/09/30.
//

import UIKit
import WebKit   // WKWebView 객체
import SafariServices //SFSafariViewController 객체

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    @IBOutlet var webkitView: WKWebView!
    
    @IBAction func openWeb(_ sender: Any) {
        // 1. 사파리 호출
        let url: URL! = URL(string: "https://www.google.com/")
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //UIWebView 객체 생성 및 핸들링
        let url: URL! = URL(string: "https://www.google.com/")
        let req = URLRequest(url: url)
        self.webView.loadRequest(req)
        
        //WKWebView 객체 생성 및 핸들링
        let wkurl: URL! = URL(string: "https://www.google.com/")
        let wkreq = URLRequest(url: wkurl)
        self.webkitView.load(wkreq)
    }

}

