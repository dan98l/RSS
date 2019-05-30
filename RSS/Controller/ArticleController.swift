//
//  ArticleController.swift
//  RSS
//
//  Created by Daniil G on 26/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation
import UIKit

final class ArticleController {
    var modelController: ArticleModel!
    var parser: Parser = Parser()
    
    func numberOfRows(model: ArticleModel) -> Int {
        return model.namesOfChannels.count
    }
    
    func setNameOfChannel(model: ArticleModel, name: String) {
        model.namesOfChannels.append(name)
    }
    
    func setUrlOfChannel(model: ArticleModel, url: String) {
        model.urlsOfChannels.append(url)
    }
    
    func getNameOfChannel(model: ArticleModel, index: Int) -> String {
        return model.namesOfChannels[index]
    }
    
    func getUrlOfChannel(model: ArticleModel, index: Int) -> String {
        return model.urlsOfChannels[index]
    }
    
    func getData(model: ArticleModel, index: Int) -> Bool{
        let urlString = model.urlsOfChannels[index]
        do {
            let data = try Data(contentsOf: URL(string: urlString)!)
                startParse(model: model, data: data, index: index)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func startParse(model: ArticleModel, data: Data, index: Int) {
        parser.parse(model: model, data: data, index: index)
    }
    
    func setCountArticlesArray(model: ArticleModel) {
        model.articles.append([Article.init(title: "nil", description: "nil", link: "nil")])
        model.sizeOfArticleArray += 1
    }
    
    func setIndexOfArticle(model: ArticleModel, index: Int) {
        model.indexOfArticle = index
    }
    
    func alignSizeOfArticle(model: ArticleModel) {
        while model.articles.count != model.sizeOfArticleArray {
            model.articles.append([Article.init(title: "nil", description: "nil", link: "nil")])
        }
    }
    
    func deleteChannel(model: ArticleModel, index: Int) {
        model.namesOfChannels.remove(at: index)
        model.urlsOfChannels.remove(at: index)
        model.sizeOfArticleArray -= 1
    }
    
    func changeNameOfChannel(model: ArticleModel, index: Int, name: String) {
        model.namesOfChannels[index] = name
    }
    
    func changeUrlOfChannel(model: ArticleModel, index: Int, url: String) {
        model.urlsOfChannels[index] = url
    }
}
