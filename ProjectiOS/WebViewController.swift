//
//  WebViewController.swift
//  ProjectiOS
//
//  Created by Kshitiz on 10/12/22.
//

import UIKit
import Foundation
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    var articleUrl:String?;
    
    @IBOutlet weak var WebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage()
    }
    

    func loadWebPage(){
        guard let myUrl = URL(string : articleUrl ?? "")else {
            return
        };
        let myRequest = URLRequest(url: myUrl)
        WebView.navigationDelegate = self;
        WebView.load(myRequest)
    }

}
