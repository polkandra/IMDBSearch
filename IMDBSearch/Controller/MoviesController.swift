//
//  MoviesController.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 28.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Foundation

class MoviesController: UIViewController {

 
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResultsImage: UIImageView!
    
    
    var movies = [Movie]()
   
    
    var movie: Movie!
    var movieId: Int!
    var queryText = ""
    
    var selectedMovie: Movie?
  
    
    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.noResultsImage.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        tableView.isHidden = true
       // self.movieId = 0
    
    }
    
    // MARK: - API call
    
    func downloadFilmDetails (completed: @escaping DownloadCompleted) {
        Alamofire.request("\(BASE_URL_FOR_SEARCH)\(API_KEY)\(QUERY)\(self.queryText)").responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let results = dict["results"] as? [Dictionary <String, AnyObject>] {
                    for obj in results {
                        let movie = Movie(filmsDict: obj)
                        self.movies.append(movie)
                        print(obj)
                    }
                    if self.movies.count == 0 {
                        self.tableView.isHidden = true
                        self.noResultsImage.isHidden = false
                    }
                    self.tableView.reloadData()

                }
                
            }
            completed()
        }
       
    }
    



// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            if let detaiVC = segue.destination as? DetailMovieController {
                
                
                //names = movies.map{$0.movieId }
              
                
                detaiVC.movie = selectedMovie
           
            }
            
        }
    }
}






extension MoviesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell {
        
            let movie : Movie!
            movie = movies[indexPath.row]
            
            cell.configureCell(movie)
           
           // self.movieId = movie.movieId;
            return cell
        }else{
            return MovieCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
}




extension MoviesController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if searchText.count == 5 {
            
            tableView.isHidden = false
            self.queryText = searchText
            self.downloadFilmDetails {
                
            }
            self.movies.removeAll()
            
        }else if searchText.count < 5 {
            tableView.isHidden = true
            
        }else if searchText.count == 10 {
            
            tableView.isHidden = false
            self.queryText = searchText
            self.downloadFilmDetails {
                
            }
            self.movies.removeAll()
            
        }else if searchText.count == 15 {
            
            tableView.isHidden = false
            self.queryText = searchText
            self.downloadFilmDetails {
                
            }
            self.movies.removeAll()
       
        }else if searchText.count == 0 {
            tableView.isHidden = false
            self.noResultsImage.isHidden = true
            self.queryText = ""
            self.movies.removeAll()
     
            
        
        }
        
        
        
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            view.endEditing(true)
            
        }
        
        
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            
        }
        
    }
    
}


