//
//  BaseError.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

enum BaseError {
    case generic
    case noError
    
    var description: String {
        switch self {
        case .generic: return "Se ha producido un error"
        default:
            return ""
        }
    }
}
