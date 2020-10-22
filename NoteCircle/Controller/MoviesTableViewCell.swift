//
//  MoviesTableViewCell.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 21/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
