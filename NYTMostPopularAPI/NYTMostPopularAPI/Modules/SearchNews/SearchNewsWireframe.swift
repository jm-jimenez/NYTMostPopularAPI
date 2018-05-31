//
//  SearchNewsWireframe.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

class SearchNewsWireframe {
    var viewController: SearchNewsViewController {
        let viewController: SearchNewsViewController = SearchNewsViewController(nibName: "SearchNewsViewController", bundle: nil)
        let presenter = SearchNewsPresenter()
        let interactor = SearchNewsInteractor()
        let dataManager = SearchNewsDataManager()
        let apiClient = SearchNewsApiClient()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.apiClient = apiClient
        
        return viewController
    }
}
