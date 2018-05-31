//
//  RowModel.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

enum RowModelType {
    case article
    case period
    case media
    
    var limit: Int {
        switch self {
        case .media:
            return 0
        default:
            return 1
        }
    }
}

class RowModel {
    var type: RowModelType
    var configItems: [ConfigItem]
    
    init(type: RowModelType, configItems: [ConfigItem]) {
        self.type = type
        self.configItems = configItems
    }
}
