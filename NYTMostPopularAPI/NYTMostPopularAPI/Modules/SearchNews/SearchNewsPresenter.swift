//
//  SearchNewsPresenter.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol SearchNewsPresenterProtocol {

}

protocol SearchNewsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

class SearchNewsPresenter: BasePresenter, SearchNewsPresenterProtocol, SearchNewsInteractorOutputProtocol {
    
    weak var view: SearchNewsViewControllerProtocol? {
        didSet {
            baseView = view
        }
    }
    
    var interactor: SearchNewsInteractorInputProtocol?
}
