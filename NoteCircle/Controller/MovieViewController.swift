//
//  MovieViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 20/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var movieTableView: UITableView!
    
    var items: [String] = ["Item1", "Item2", "Item3", "Item4"]
    var movieImage: [UIImage] = [
        UIImage(named: "item1")!,UIImage(named: "item2")!,UIImage(named: "item3")!,UIImage(named: "item4")!
    ]
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    // MARK: - View Methods
    fileprivate func setupView() {
        movieTableView.register(UINib(nibName: "MoviePopularTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }
    
    
}
// MARK: - UITableViewDataSource
extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviePopularTableViewCell", for: indexPath) as! MoviePopularTableViewCell
        cell.label.text = items[indexPath.row]
        cell.popularMovieImageView.image = movieImage[indexPath.row]
        
        return cell
    }
    
}
