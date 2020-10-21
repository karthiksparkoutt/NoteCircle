//
//  MoviePopularTableViewCell.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 20/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class MoviePopularTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var popularMovieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
