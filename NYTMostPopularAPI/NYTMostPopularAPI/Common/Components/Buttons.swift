//
//  Buttons.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import Foundation
import UIKit

class CheckBoxButton: UIButton {
    
    var indexPath: IndexPath?
    
    private var checked: UIImage? {
        let image = #imageLiteral(resourceName: "checkbox-checked").withRenderingMode(.alwaysTemplate)
        return image
    }
    
    private var unchecked: UIImage? {
        let image = #imageLiteral(resourceName: "checkbox-unchecked").withRenderingMode(.alwaysTemplate)
        return image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImage(checked, for: .selected)
        setImage(unchecked, for: .normal)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected { tintColor = .blue }
            else { tintColor = .gray }
        }
    }
}

class NextButton: UIButton {
    
    private var selectedImage: UIImage? {
        let image = #imageLiteral(resourceName: "next").withRenderingMode(.alwaysTemplate)
        return image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImage(selectedImage, for: .normal)
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled { tintColor = .blue }
            else { tintColor = .gray }
        }
    }
}
