//
//  NewsResultsWireframe.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class NewsResultsWireframe {
    
    private var path: String
    
    var viewController: NewsResultsViewController {
        let viewController: NewsResultsViewController = NewsResultsViewController(nibName: "NewsResultsViewController", bundle: nil)
        let presenter = NewsResultsPresenter()
        let interactor = NewsResultsInteractor()
        let dataManager = NewsResultsDataManager()
        let apiClient = NewsResultsApiClient(path: path)
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.apiClient = apiClient
        
        return viewController
    }
    
    init(path: String) {
        self.path = path
    }
    
    func present() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let navigation = appDelegate.window!.rootViewController as? UINavigationController
        navigation?.pushViewController(viewController, animated: true)
    }
}
