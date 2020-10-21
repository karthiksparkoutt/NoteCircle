//
//  MoviesViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 21/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    let movieTitle = ["nameOne", "nameTwo", "nameThree", "nameFour"]
    let movieImage = [UIImage(named: "item1"), UIImage(named: "item2"), UIImage(named: "item3"), UIImage(named: "item4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    private func setupView() {
        movieTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
    }
    
    
    
}
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MoviesTableViewCell
        cell.movieLabel.text = movieTitle[indexPath.row]
        cell.movieImageView.image = movieImage[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
