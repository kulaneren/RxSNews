//
//  ArticleTableViewCell.swift
//  RxSNews
//
//  Created by eren kulan on 22/10/2019.
//  Copyright © 2019 eren kulan. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ article: Article){
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description
    }
}
