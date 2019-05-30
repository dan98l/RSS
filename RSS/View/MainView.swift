//
//  MainView.swift
//  RSS
//
//  Created by Daniil G on 26/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import UIKit

class MainView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var articleModel: ArticleModel!
    var articleController: ArticleController!
    var dbManager: DBManager!
    var indexOfCell: Int?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cityButtons: [UIButton]!
    
    @IBAction func handleSelection(_ sender: UIButton) {
        hiddenButtonMenu()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let button = ChoiceButton(rawValue: title) else {
            return
        }
        switch button {
        case .addChannel:
            self.performSegue(withIdentifier: "AddChannelShow", sender: self)
            hiddenButtonMenu()
        case .about:
            self.performSegue(withIdentifier: "AboutAppShow", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbManager.obtainModel(model: articleModel)
        articleController.alignSizeOfArticle(model: articleModel)
        let nib = UINib(nibName: "ChannelCell", bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: "ChannelCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dbManager.save(model: articleModel)
        // dbManager.resetDefaults() /// удаление всех данных, чтобы не забыть :)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleController.numberOfRows(model: articleModel)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelCell", for: indexPath) as? ChannelCell else {
            assertionFailure("Can't dequeue cell.")
            return UITableViewCell()
        }
        
        cell.nameChannel.text = articleController.getNameOfChannel(model: articleModel, index: indexPath.row)
        cell.urlChannel.text = articleController.getUrlOfChannel(model: articleModel, index: indexPath.row)
        
        return cell
    }
    
    func hiddenButtonMenu() {
        cityButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            self.articleController.deleteChannel(model: self.articleModel, index: indexPath.row)
            self.tableView.reloadData()
            self.dbManager.save(model: self.articleModel)
            completionHandler(true)
        }
        
        let rename = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
            self.indexOfCell = indexPath.row
            self.performSegue(withIdentifier: "changeChannelShow", sender: self)
            completionHandler(true)
        }
        let swipeActionConfig = UISwipeActionsConfiguration(actions: [rename, delete])
        swipeActionConfig.performsFirstActionWithFullSwipe = false
        
        return swipeActionConfig
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        articleController.setIndexOfArticle(model: articleModel, index: indexPath.row)
        if articleController.getData(model: articleModel, index: indexPath.row) {
                self.performSegue(withIdentifier: "ArticlesView", sender: self)
        } else {
            self.performSegue(withIdentifier: "ErrorUrl", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addChannelView = segue.destination as? AddChannelView {
            addChannelView.articleModel = articleModel
            addChannelView.articleController = articleController
        }
        if let articlesView = segue.destination as? ArticlesView {
            articlesView.articleModel = articleModel
            articlesView.articleController = articleController
        }
        if let editChannelsView = segue.destination as? EditChannelsView {
            editChannelsView.articleModel = articleModel
            editChannelsView.articleController = articleController
            editChannelsView.indexOfCell = self.indexOfCell
        }
    }

}
