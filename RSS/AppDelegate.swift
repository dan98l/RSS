//
//  AppDelegate.swift
//  RSS
//
//  Created by Daniil G on 26/05/2019.
//  Copyright © 2019 Daniil G. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let mainViewController = window?.rootViewController as? MainView {
            mainViewController.articleModel = ArticleModel()
        }
        
        if let mainViewController = window?.rootViewController as? MainView {
            mainViewController.articleController = ArticleController()
        }
        
        if let mainViewController = window?.rootViewController as? MainView {
            mainViewController.dbManager = DBManager()
        }
        
        return true
    }
}

