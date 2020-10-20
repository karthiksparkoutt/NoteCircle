//
//  MovieViewController.swift
//  NoteCircle
//
//  Created by Karthik Rajan T  on 19/10/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var popularMovieCollectionView: UICollectionView!
    @IBOutlet weak var movieEventCollectionView: UICollectionView!
    
    private let apiURL = "https://api.themoviedb.org/3/5afb74f0331b3a1755910a738c87a133"
    private let api_key = "5afb74f0331b3a1755910a738c87a133"
    private let imageURL = "https://image.tmdb.org/t/p/"
    private var images = [ImageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popularMovieCollectionView.delegate = self
        popularMovieCollectionView.dataSource = self
        
        movieEventCollectionView.delegate = self
        movieEventCollectionView.dataSource = self
        
    }
    func getLatestImage() {
        guard let movieURL = URL(string: apiURL) else {
            return
        }
        
        let request = URLRequest(url: movieURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                self.images = self.parseJsonData(data: data)
                
                OperationQueue.main.addOperation({
                    self.popularMovieCollectionView.reloadData()
                    self.movieEventCollectionView.reloadData()
                })
            }
        })
        
        task.resume()
    }
    func parseJsonData(data: Data) -> [ImageModel] {
        
        var images = [ImageModel]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            let jsonImages = jsonResult?["images"] as! [AnyObject]
            for jsonImage in jsonImages {
                var image = ImageModel()
                
                image.name = jsonImage["name"] as! String
                image.image = jsonImage["use"] as! String
                
                images.append(image)
            }
            
        } catch {
            print(error)
        }
        
        return images
    }
    
    
}
extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MovieEventCollectionViewCell
        return cell
        
    }
    
    
}
