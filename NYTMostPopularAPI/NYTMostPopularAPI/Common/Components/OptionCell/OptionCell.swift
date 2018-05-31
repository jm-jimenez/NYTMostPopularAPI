//
//  OptionCell.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 31/05/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

protocol OptionCellDelegate: AnyObject {
    func didTapOnBtn1(at: IndexPath)
    func didTapOnBtn2(at: IndexPath)
    func didTapOnBtn3(at: IndexPath)
}

class OptionCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var element1Btn: CheckBoxButton!
    @IBOutlet weak var element1Label: UILabel!
    @IBOutlet weak var element2Btn: CheckBoxButton!
    @IBOutlet weak var element2Label: UILabel!
    @IBOutlet weak var element3Btn: CheckBoxButton!
    @IBOutlet weak var element3Label: UILabel!
    
    // MARK: - Properties
    weak var delegate: OptionCellDelegate?
    
    // MARK: - Default methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configure Cell
    func configCellWith(configItems: [ConfigItem], at indexPath: IndexPath) {
        if configItems.count < 3 {
            element3Btn.isHidden = true
            element3Label.isHidden = true
        } else {
            element3Btn.isHidden = false
            element3Label.isHidden = false
        }
        
        configItems.enumerated().forEach { (index, element) in
            switch index {
            case 0:
                element1Btn.isSelected = element.isSelected
                element1Btn.indexPath = indexPath
                element1Label.text = element.description
            case 1:
                element2Btn.isSelected = element.isSelected
                element2Btn.indexPath = indexPath
                element2Label.text = element.description
            case 2:
                element3Btn.isSelected = element.isSelected
                element3Btn.indexPath = indexPath
                element3Label.text = element.description
            default: break
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func didTapOnButton(_ sender: CheckBoxButton) {
        sender.isSelected = !sender.isSelected
        guard let indexPath = sender.indexPath else { return }
        switch sender {
        case element1Btn:
            delegate?.didTapOnBtn1(at: indexPath)
        case element2Btn:
            delegate?.didTapOnBtn2(at: indexPath)
        case element3Btn:
            delegate?.didTapOnBtn3(at: indexPath)
        default:
            break
        }
    }
}
