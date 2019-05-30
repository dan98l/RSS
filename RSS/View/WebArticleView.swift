//
//  WebArticleView.swift
//  RSS
//
//  Created by Daniil G on 29/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import UIKit
import WebKit

final class WebArticleView: UIViewController {
    var articleModel: ArticleModel!
    var indexOfCell: Int?
    
    @IBAction func backSegueButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    @IBOutlet var webView: WKWebView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        let url = URL(string: articleModel.articles[articleModel.indexOfArticle!][indexOfCell!].link)!
        
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
}
