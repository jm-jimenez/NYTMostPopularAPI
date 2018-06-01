//
//  BaseApiClient.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import Alamofire

class BaseApiClient {
    
    private var sessionManager: Alamofire.SessionManager
    private var baseUrl: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError("ERROR WHILE OBTAINING BASE URL")}
        return url
    }
    
    init() {
        sessionManager = SessionManager.default
    }
    
    func request(_ path: String, method: HTTPMethod = .post, parameters: [String: Any]? = nil) -> DataRequest {
        
        let completeURL = baseUrl.appendingPathComponent(path)
        var params: [String : Any] = [Constants.apiKeyKey: Constants.apiKeyValue]
        if let parameters = parameters { params.merge(parameters) { (first, _) in first } }
        return sessionManager.request(completeURL, method: method, parameters: params, encoding: URLEncoding.default, headers: nil)
    }
    
    func handleError<T: Any>(response: DataResponse<T>) -> BaseError {
        var error: BaseError = .generic
        if let statusCode = response.response?.statusCode, statusCode == 200 { error = .noError }
        
        return error
    }
}
