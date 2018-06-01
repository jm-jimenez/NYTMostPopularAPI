//
//  NewsResultsApiClient.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol NewsResultsApiClientProtocol {
    func getResults(success: @escaping ([Results]) -> Void, failure: @escaping (BaseError) -> Void)
}

class NewsResultsApiClient: BaseApiClient, NewsResultsApiClientProtocol {
    private var path: String
    
    init(path: String) {
        self.path = path
    }
    
    func getResults(success: @escaping ([Results]) -> Void, failure: @escaping (BaseError) -> Void ) {
        self.request(path, method: .get).responseObject { (response: DataResponse<SearchNewsResponse>) in
            
            let error = self.handleError(response: response)
            if error != .noError {
                failure(error)
            } else {
                guard let results = response.result.value?.results else {
                    failure(.generic)
                    return
                }
                success(results)
            }
            print(response)
        }
    }
}
