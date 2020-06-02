//
//  A034_DataViewController.swift
//  SleepLog
//
//  Created by 35c on 2020/04/14.
//  Copyright © 2020 iOS開発. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKScriptMessageHandler {
    
    // WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == "successHandler") {
            alert(message: "\(message.body)", title: "")
        }
        if(message.name == "errorHandler") {
            alert2(message: "\(message.body)", title: "")
        }
    }
    
    @IBOutlet var webView:WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    

    func setUp(){
        // WKWebViewConfiguration Setting ①
        let webCfg: WKWebViewConfiguration = WKWebViewConfiguration()
        let userController: WKUserContentController = WKUserContentController()
        userController.add(self, name: "successHandler")
        userController.add(self, name: "errorHandler")
        webCfg.userContentController = userController
        var frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.bounds.size.width,
            height: self.view.bounds.size.height)
        webView = WKWebView(frame: frame, configuration: webCfg)
        // DelegateSetting　②
        webView.navigationDelegate = self
        // 3DTouchを有効か無効か（基本無効にしている）
        webView.allowsLinkPreview = false
        // フルスクリーン化メソッドをコール
        self.setLayoutFullScreenWebView(webView: webView, view: view)
        
        self.view.addSubview(webView)
        
        // 指定ページをコール
        let URL:String = "https://yahoo.co.jp"
        let url = URL(string: URL)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
    }
    
    // WKNavigationDelegate
    // ページが表示されたら下記の関数を実行(どのメソッドを使うかは利用のタイミング次第です)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let activeUrl: URL? = self.webView.url
        let url = activeUrl?.absoluteString
        // 特定のURLで分岐処理
        if url! == "https://www.apple.com/jp/" {
            print("Apple")
        }
    }

    // Autolayoutでフルスクリーン化するためのMethod
    public func setLayoutFullScreenWebView(webView: WKWebView, view: UIView) {

        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(
            [NSLayoutConstraint(
                item:webView,
                attribute:NSLayoutConstraint.Attribute.width,
                relatedBy:NSLayoutConstraint.Relation.equal,
                toItem:view,
                attribute:NSLayoutConstraint.Attribute.width,
                multiplier:1.0,
                constant:0
                )]
        )
        view.addConstraints(
            [NSLayoutConstraint(
                item:webView,
                attribute:NSLayoutConstraint.Attribute.height,
                relatedBy:NSLayoutConstraint.Relation.equal,
                toItem:view,
                attribute:NSLayoutConstraint.Attribute.height,
                multiplier:1.0,
                constant:0
                )]
        )
    }
    
    
    // AlertMethod
    func alert(message:String,title:String){
        let myAlert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(myOkAction)
        present(myAlert, animated: true, completion: nil)
    }
}
