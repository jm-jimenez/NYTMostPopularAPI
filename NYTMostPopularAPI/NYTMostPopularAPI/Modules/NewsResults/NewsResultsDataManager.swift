//
//  NewsResultsDataManager.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol NewsResultsDataManagerProtocol {
    func getResults(success: @escaping ([Results]) -> Void, failure: @escaping (BaseError) -> Void)
}

class NewsResultsDataManager: NewsResultsDataManagerProtocol {
    
    var apiClient: NewsResultsApiClientProtocol?
    
    func getResults(success: @escaping ([Results]) -> Void, failure: @escaping (BaseError) -> Void) {
        apiClient?.getResults(success: success, failure: failure)
    }
}
