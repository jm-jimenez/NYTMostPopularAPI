//
//  BaseViewController.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    // MARK: - Object Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
