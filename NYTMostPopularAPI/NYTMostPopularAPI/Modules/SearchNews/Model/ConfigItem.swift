//
//  ConfigItem.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol ConfigItemProtocol {
    var description: String { get }
}

class ConfigItem {
    var isSelected: Bool = false
    var description: String
    
    init (type: ConfigItemProtocol){
        description = type.description
    }
}
