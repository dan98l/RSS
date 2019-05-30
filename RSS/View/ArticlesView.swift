//
//  ArticlesView.swift
//  RSS
//
//  Created by Daniil G on 26/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import UIKit

final class ArticlesView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var articleModel: ArticleModel!
    var articleController: ArticleController!
    var indexOfCell: Int?
    
    @IBOutlet var tableView: UITableView!
    @IBAction func backSegueButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "ArticleCell", bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: "ArticleCell")

        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleModel.articles[articleModel.indexOfArticle!].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
            assertionFailure("Can't dequeue cell.")
            return UITableViewCell()
        }
        
        cell.titleNews.text? = articleModel.articles[articleModel.indexOfArticle!][indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexOfCell = indexPath.row
        self.performSegue(withIdentifier: "DescriptionViewShow", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainView = segue.destination as? MainView {
            mainView.articleModel = articleModel
        }
        if let descriptionArticleView = segue.destination as? DescriptionArticleView {
            descriptionArticleView.articleModel = articleModel
            descriptionArticleView.indexOfCell = indexOfCell
        }
    }
    
}
