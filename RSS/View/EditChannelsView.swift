//
//  EditChannelsView.swift
//  RSS
//
//  Created by Daniil G on 28/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import Foundation

import UIKit

final class EditChannelsView: UIViewController {
    var articleModel: ArticleModel!
    var articleController: ArticleController!
    var indexOfCell: Int?
    
    @IBOutlet var nameRssChannel: UITextField!
    @IBOutlet var urlRssChannel: UITextField!
    @IBAction func changeButtonView(_ sender: Any) {
        if urlRssChannel.text != "" && nameRssChannel.text != ""{
            articleController.changeNameOfChannel(model: articleModel, index: indexOfCell!, name: nameRssChannel.text! )
            articleController.changeUrlOfChannel(model: articleModel, index: indexOfCell!, url: urlRssChannel.text!)
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelViewButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        nameRssChannel.text = articleController.getNameOfChannel(model: articleModel, index: indexOfCell!)
        urlRssChannel.text = articleController.getUrlOfChannel(model: articleModel, index: indexOfCell!)
    }
}

