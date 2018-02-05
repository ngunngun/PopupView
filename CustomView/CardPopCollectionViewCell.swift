//
//  CardPopCollectionViewCell.swift
//  CustomView
//
//  Created by Lullaby on 5/2/2561 BE.
//  Copyright © 2561 Lullaby. All rights reserved.
//

import UIKit

class CardPopCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    var object:PopObj? {
        didSet {
            if let popObj = self.object {
//                self.downloadImage(url: URL(string: popObj.img)!)
                self.titleLabel.text = popObj.title
                self.descLabel.text = popObj.desc
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.borderWidth = 1
//        self.contentView.borderColor = .black
    }


}
