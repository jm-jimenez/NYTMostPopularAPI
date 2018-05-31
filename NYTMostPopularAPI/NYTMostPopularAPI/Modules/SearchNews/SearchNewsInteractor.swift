//
//  SearchNewsInteractor.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol SearchNewsInteractorInputProtocol {
    func setRowModels(_ rowModels: [RowModel])
    func updateConfigItemStatus(at: Int, rowModelIndex: Int)
    func didTapNext()
}

class SearchNewsInteractor: SearchNewsInteractorInputProtocol {
    weak var presenter: SearchNewsInteractorOutputProtocol?
    var dataManager: SearchNewsDataManagerProtocol?
    private var rowModelsStatus: [RowModel]?
    
    // MARK: - Private Methods
    private func shouldShowMediaRow(rowModelIndex: Int, at: Int, previousStatus: Bool, rowModelsToUpdate rowModels: inout [RowModel]) {
        if rowModelIndex == 0 && at == 1 && !previousStatus {
            rowModels.insert(RowModel(type: .media, configItems: [ConfigItem(type: MediaType.facebook), ConfigItem(type: MediaType.twitter)]), at: 2)
        } else if rowModelIndex == 0 && at == 1 && previousStatus {
            rowModels.remove(at: 2)
        } else if rowModelIndex == 0 && !previousStatus && rowModels.count > 2 {
            rowModels.remove(at: 2)
        }
    }
    
    // MARK: - SearchNewsInteractorInputProtocol
    func setRowModels(_ rowModels: [RowModel]) {
        rowModelsStatus = rowModels
    }
    
    func updateConfigItemStatus(at: Int, rowModelIndex: Int) {
        guard let rowModelsUnwrap = rowModelsStatus else { return }
        var rowModels = rowModelsUnwrap
        let previousStatus = rowModels[rowModelIndex].configItems[at].isSelected
        let selectedItems = rowModels[rowModelIndex].configItems.filter({ $0.isSelected }).count
        if selectedItems == rowModels[rowModelIndex].type.limit {
            rowModels[rowModelIndex].configItems.forEach { $0.isSelected = false }
        }
        shouldShowMediaRow(rowModelIndex: rowModelIndex, at: at, previousStatus: previousStatus, rowModelsToUpdate: &rowModels)
        rowModels[rowModelIndex].configItems[at].isSelected = !previousStatus
        rowModelsStatus = rowModels
        presenter?.updateViewModelsWith(rowModels)
    }
    
    func didTapNext() {
        guard let rowModels = rowModelsStatus else { return }
        let articleFilter = rowModels[0].configItems.first(where: { $0.isSelected })
        let periodFilter = rowModels[1].configItems.first(where: { $0.isSelected })
        var mediaFilter: [ConfigItem]?
        if rowModels.count > 2 {
            mediaFilter = rowModels[2].configItems.filter { $0.isSelected }
        }
        guard let articleFilterUnwrap = articleFilter, let periodFilterUnwrap = periodFilter else { return }
        var path = "/\(articleFilterUnwrap.description)/all-sections/"
        if let unwrapFilter = mediaFilter {
            if unwrapFilter.count > 1 {
                path.append("\(unwrapFilter[0].description);\(unwrapFilter[1].description)/")
            }
            else {
                path.append("\(unwrapFilter[0].description)/")
            }
        }
        path.append("\(periodFilterUnwrap.description).json?api-key=32534511931e4dc1b5627b6918ca0d6b")
        print(path)
    }
}
