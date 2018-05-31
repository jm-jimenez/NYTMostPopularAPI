//
//  SearchNewsPresenter.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol SearchNewsPresenterProtocol {
    func loadModels()
    func updateConfigItemStatus(at: Int, rowModelIndex: Int)
    func didTapNext()
}

protocol SearchNewsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func updateViewModelsWith(_ rowModels: [RowModel])
}

class SearchNewsPresenter: BasePresenter, SearchNewsPresenterProtocol, SearchNewsInteractorOutputProtocol {
    
    weak var view: SearchNewsViewControllerProtocol? {
        didSet {
            baseView = view
        }
    }
    
    var interactor: SearchNewsInteractorInputProtocol?
    
    // MARK: - SearchNewsPresenterProtocol
    func loadModels() {
        var models: [RowModel] = [RowModel]()
        models.insert(RowModel(type: .article, configItems: [ConfigItem(type: ArticleType.mostEmailed), ConfigItem(type: ArticleType.mostShared), ConfigItem(type: ArticleType.mostViewed)]), at: 0)
        models.insert(RowModel(type: .period, configItems: [ConfigItem(type: PeriodType.day), ConfigItem(type: PeriodType.week), ConfigItem(type: PeriodType.month)]), at: 1)
        interactor?.setRowModels(models)
        view?.updateModelsWith(elements: models)
    }
    
    func updateConfigItemStatus(at: Int, rowModelIndex: Int) {
        interactor?.updateConfigItemStatus(at: at, rowModelIndex: rowModelIndex)
    }
    
    func didTapNext() {
        interactor?.didTapNext()
    }
    
    // MARK: - SearchNewsInteractorOutputProtocol
    func updateViewModelsWith(_ rowModels: [RowModel]) {
        view?.updateModelsWith(elements: rowModels)
        let row1Selected = rowModels[0].configItems.filter({ $0.isSelected }).count == 1
        let row2Selected = rowModels[1].configItems.filter({ $0.isSelected }).count == 1
        let row3Selected = rowModels.count > 2 ? rowModels[2].configItems.filter({ $0.isSelected }).count > 0 : true
        
        view?.shouldEnableNextButton(row1Selected && row2Selected && row3Selected)
    }
}
