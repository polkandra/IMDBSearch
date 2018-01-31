//
//  DetailMovieController.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 30.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class DetailMovieController: UITableViewController {
    
    
    @IBOutlet weak var staticCell: DetailCell!
    //@IBOutlet weak var tableView: UITableView!
    
    
    var requestURL = ""
    var movieId = 0
    var movie: Movie!
    var movieDetails: MovieDetails!
    
   
    
    
    // MARK: - VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        movieId = movie.movieId
        self.requestURL = "\(BASE_URL_FOR_DETAILS)\(self.movieId)\(API_KEY_FOR_DETAILS)"
       
        self.downloadFilmDetails {

            self.navigationItem.title = self.movie.title
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
    }
   
    
    // MARK: - API call
    
//    func downloadFilmDetails (completed: @escaping DownloadCompleted) {
//        Alamofire.request(requestURL).responseJSON { response in
//            let result = response.result
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//
//                let movie = MovieDetails(filmDetailsDict: dict)
//
//                 self.staticCell.configureCell(movie)
//            }
//            completed()
//        }
//    }

    

    func downloadFilmDetails (completed: @escaping DownloadCompleted) {
        Alamofire.request(requestURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                let movie = MovieDetails(filmDetailsDict: dict)
                
                self.staticCell.configureCell(movie)
            }
            completed()
        }
    }

   
    
    
    
    
    
    
    
    
    
    
    // MARK: - Actions

    @IBAction func shareTapped(_ sender: UIBarButtonItem) {
        
    }





}



