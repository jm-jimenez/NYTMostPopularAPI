//
//  NewsResultCellViewModel.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

struct NewsResultCellViewModel {
    var image: String?
    var title: String?
    var author: String?
    var section: String?
    var date: String?
    var url: String?
    
    init(result: Results) {
        self.title = result.title
        self.author = result.byline
        self.section = result.section
        self.date = result.publishedDate
        self.url = result.url
        if result.hasImages {
            let media = result.media?.first(where: { $0.isImage })
            image = media?.mediaMetadata?.url
        }
    }
}
