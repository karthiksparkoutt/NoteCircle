//
//  MoviesViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 21/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var movieTableView: UITableView!
    let movieTitle = ["nameOne", "nameTwo", "nameThree", "nameFour"]
    let movieImage = [UIImage(named: "item1"), UIImage(named: "item2"), UIImage(named: "item3"), UIImage(named: "item4")]
    let imageUrlString = "http://swiftdeveloperblog.com/wp-content/uploads/2015/07/1.jpeg"
    var petitions = [Petition]()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View Methods
    private func setupView() {
        movieTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let urlString = "https://api.themoviedb.org/3/trending/movie/day?api_key=5afb74f0331b3a1755910a738c87a133"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            movieTableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MoviesTableViewCell
        cell.movieLabel.text = petitions[indexPath.row].posterpath
        let defaultLink = "https://image.tmdb.org/t/p/"
        let completeLink = defaultLink + petitions[indexPath.row].posterpath
        cell.movieImageView.downloaded(from: completeLink)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
//Mark :- Downloading Image
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
