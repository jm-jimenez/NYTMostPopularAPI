//
//  BasePresenter.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation

protocol BaseInteractorOutputProtocol: AnyObject {

}

class BasePresenter: BaseInteractorOutputProtocol {
    weak var baseView: BaseViewControllerProtocol?
}
