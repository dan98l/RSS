//
//  AddChannelView.swift
//  RSS
//
//  Created by Daniil G on 26/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import UIKit

final class AddChannelView: UIViewController {
    var articleModel: ArticleModel!
    var articleController: ArticleController!
    
    @IBOutlet var nameRssChannel: UITextField!
    @IBOutlet var urlRssChannel: UITextField!
    @IBAction func addRssChannelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        if urlRssChannel.text != "" && nameRssChannel.text != ""{
            articleController.setNameOfChannel(model: articleModel, name: nameRssChannel.text!)
            articleController.setUrlOfChannel(model: articleModel, url: urlRssChannel.text!)
            articleController.setCountArticlesArray(model: articleModel)
        }
    }
    @IBAction func cancelViewButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
