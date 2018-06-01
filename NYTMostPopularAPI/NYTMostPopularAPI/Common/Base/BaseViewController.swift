//
//  BaseViewController.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import PopupDialog

protocol BaseViewControllerProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ error: BaseError)
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    // MARK: - Object Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - BaseViewControllerProtocol
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(_ error: BaseError) {
        let popup = PopupDialog(title: nil, message: error.description)
        let button = PopupDialogButton(title: "OK", action: nil)
        popup.addButton(button)
        self.present(popup, animated: true, completion: nil)
    }
}
