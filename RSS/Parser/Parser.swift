//
//  Parser.swift
//  RSS
//
//  Created by Daniil G on 27/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation
import SwiftyXMLParser

final class Parser {
    
    var modelController: ArticleModel!
    
    func parse(model: ArticleModel, data: Data, index: Int) {
        let xml = XML.parse(data)
        var tempArray: [Article] = []
        for i in 0...90 {
            let title = xml.rss.channel.item[i].title.text
            let description = xml.rss.channel.item[i]["description"].text
            let link = xml.rss.channel.item[i].link.text
            
            if title != nil && link != nil {
                tempArray.append(Article.init(title: title!, description: description!, link: link!))
            }
        }
        
        if tempArray.count != 0 {
            model.articles[index] = tempArray
        } else {
            model.articles.append([Article.init(title: "nil", description: "nil", link: "nil")])
        }
        
        if case .failure(XMLError.interruptedParseError) = xml {
            print("invalid character")
        }
    }
}
