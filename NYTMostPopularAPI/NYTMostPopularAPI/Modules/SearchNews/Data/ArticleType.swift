//
//  ArticleType.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

enum ArticleType: String, ConfigItemProtocol {
    
    case mostEmailed = "mostemailed"
    case mostShared = "mostshared"
    case mostViewed = "mostviewed"
    
    var description: String {
        return self.rawValue
    }
}

enum PeriodType: Int, ConfigItemProtocol {
    case day = 1
    case week = 7
    case month = 30
    
    var description: String {
        return String(self.rawValue)
    }
}

enum MediaType: String, ConfigItemProtocol {
    case facebook = "facebook"
    case twitter = "twitter"
    
    var description: String {
        return self.rawValue
    }
}
