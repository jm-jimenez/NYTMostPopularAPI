//
//  SearchNewsViewController.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol SearchNewsViewControllerProtocol: BaseViewControllerProtocol {
    
}

class SearchNewsViewController: BaseViewController, SearchNewsViewControllerProtocol {

    var presenter: SearchNewsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
