//
//  DescriptionArticleView.swift
//  RSS
//
//  Created by Daniil G on 29/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//



import UIKit

final class DescriptionArticleView: UIViewController {
    var articleModel: ArticleModel!
    var indexOfCell: Int?
    @IBOutlet var descriptionArticleLabel: UILabel!
    @IBAction func lookButtonView(_ sender: Any) {
        self.performSegue(withIdentifier: "webArticleShow", sender: self)
    }
    @IBAction func cancelViewButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        if articleModel.articles[articleModel.indexOfArticle!][indexOfCell!].description == "" {
            descriptionArticleLabel.text = "К сожалению, не удалось получить описание новости, возможно, описания просто нет."
        } else {
            descriptionArticleLabel.text = articleModel.articles[articleModel.indexOfArticle!][indexOfCell!].description
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let webArticleView = segue.destination as? WebArticleView {
            webArticleView.articleModel = articleModel
            webArticleView.indexOfCell = indexOfCell
        }
    }
    
}
