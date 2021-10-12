//
//  DetailViewController.swift
//  TableViewSample
//
//  Created by 이동규 on 2021/09/30.
//

//import Foundation
import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO! // 목록화면에서 영화정보를 받을 변수
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("linkurl == \(self.mvo.detail!), title == \(self.mvo.title!)")
        
        // 웹뷰의 WKNavigationDelegate 델리게이트 객체 지정
        self.wv.navigationDelegate = self
        
        // 네비게이션 아이템 이름 변경
        let navBarTitle = self.navigationItem
        navBarTitle.title = self.mvo.title
        
        // 웹뷰를 위한 URL 인스턴스 생성
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        self.wv.load(req)
    }
}

// MARK: - WKNavigationDelegate 프로토콜 구현
extension DetailViewController: WKNavigationDelegate {
    // didcommit 은 페이지의 컨텐츠를 읽어들이기 시작할 때 메소드
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
    }
}
