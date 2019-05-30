//
//  ArticleModel.swift
//  RSS
//
//  Created by Daniil G on 26/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation

class ArticleModel {
    var urlsOfChannels: [String] = ["https://www.liga.net/news/sport/rss.xml"]
    var namesOfChannels: [String] = ["Liga"]
    var articles: [[Article]] = [[Article.init(title: "title", description: "sess", link: "link")]]
    var indexOfArticle: Int?
    var sizeOfArticleArray = 1
}
