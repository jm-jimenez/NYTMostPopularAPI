//
//  NewsResultsPresenter.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol NewsResultsPresenterProtocol {
    func getResults()
}

protocol NewsResultsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func resultsFound(_ results: [Results])
}

class NewsResultsPresenter: BasePresenter, NewsResultsPresenterProtocol, NewsResultsInteractorOutputProtocol {
    
    weak var view: NewsResultsViewControllerProtocol? {
        didSet {
            baseView = view
        }
    }
    
    var interactor: NewsResultsInteractorInputProtocol?
    
    func getResults() {
        view?.showLoading()
        interactor?.getResults()
    }
    
    func resultsFound(_ results: [Results]) {
        let viewModels = results.map { NewsResultCellViewModel(result: $0) }
        view?.updateViewModels(with: viewModels)
        view?.hideLoading()
    }
}
