//
//  TableViewCell.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 27/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier  = "Cell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
