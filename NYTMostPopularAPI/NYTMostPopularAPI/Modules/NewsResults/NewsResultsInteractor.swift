//
//  NewsResultsInteractor.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol NewsResultsInteractorInputProtocol {
    func getResults()
}

class NewsResultsInteractor: NewsResultsInteractorInputProtocol {
    
    weak var presenter: NewsResultsInteractorOutputProtocol?
    var dataManager: NewsResultsDataManagerProtocol?
    
    func getResults() {
        dataManager?.getResults(success: { (results: [Results]) in
            self.presenter?.resultsFound(results)
        }, failure: { (error) in
            self.presenter?.showError(error: error)
        })
    }
}
