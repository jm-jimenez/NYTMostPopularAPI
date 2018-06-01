//
//  NewsResultCell.swift
//  NYTMostPopularAPI
//
//  Created by José María Jiménez on 01/06/2018.
//  Copyright © 2018 José María Jiménez. All rights reserved.
//

import UIKit

class NewsResultCell: UITableViewCell {
    
    @IBOutlet weak var media: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(with viewModel: NewsResultCellViewModel) {
        //self.media.image = viewModel.image
        self.title.text = viewModel.title
        self.author.text = viewModel.author
        self.section.text = viewModel.section
        self.date.text = viewModel.date
    }
}
