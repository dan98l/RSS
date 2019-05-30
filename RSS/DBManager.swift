//
//  DBManager.swift
//  RSS
//
//  Created by Daniil G on 27/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation


final class DBManager {
    var articleModel: ArticleModel!
    
    func save(model: ArticleModel) {
        UserDefaults.standard.set(model.urlsOfChannels, forKey: "urlsOfChannels")
        UserDefaults.standard.set(model.namesOfChannels, forKey: "namesOfChannels")
        UserDefaults.standard.set(model.indexOfArticle, forKey: "indexOfArticle")
        UserDefaults.standard.set(model.sizeOfArticleArray, forKey: "sizeOfArticleArray")
    }
    
    func obtainModel(model: ArticleModel) {
        if let setUrlsOfChannels = UserDefaults.standard.object(forKey: "urlsOfChannels") {
            model.urlsOfChannels = setUrlsOfChannels as! [String]
        }
        if let setNamesOfChannels = UserDefaults.standard.object(forKey: "namesOfChannels") {
            model.namesOfChannels = setNamesOfChannels as! [String]
        }
        if let setIndexOfArticle = UserDefaults.standard.object(forKey: "indexOfArticle") {
            model.indexOfArticle = (setIndexOfArticle as! Int)
        }
        if let setSizeOfArticleArray = UserDefaults.standard.object(forKey: "sizeOfArticleArray") {
            model.sizeOfArticleArray = (setSizeOfArticleArray as! Int)
        }
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

