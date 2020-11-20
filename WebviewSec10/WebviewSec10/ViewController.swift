//
//  ViewController.swift
//  WebviewSec10
//
//  Created by Training on 2020/11/20.
//  Copyright © 2020 training. All rights reserved.
//

import UIKit
import WebKit
//パーツの配置の仕方
//WebKit webビュー表示時に必要なフレームワーク
//プログラムの塊、

class ViewController: UIViewController,WKNavigationDelegate {
    
    //実体になっている
    var webView = WKWebView()
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //実体になっている
        
        //大きさ
        webView.frame = CGRect(x: 0, y:toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height * 2)
        //WEBview添付
        view.addSubview(webView)
        
        //何をロード
        webView.navigationDelegate = self
        let url = URL(string: "https://news.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        //WebKit内にあるload
        webView.load(request)
        
        //どこにつけるか
        
    }
    //ロードが開始されたとき,didcomit
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        //startAnimating-
        indicator.startAnimating()
    }
    //ロードが完了したときdidfinish
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("ロード完了")
        //stopAnimating-
        indicator.stopAnimating()
    }
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    //ロードが完了したとき
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
}

