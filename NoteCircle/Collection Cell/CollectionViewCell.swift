//
//  CollectionViewCell.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 27/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet var trendingImage: UIImageView!
    @IBOutlet var trendingLabel: UILabel!
    
    static let identifier = "MyCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
