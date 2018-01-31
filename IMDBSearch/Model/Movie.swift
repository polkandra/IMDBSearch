//
//  Movie.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 28.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Movie {
    
    var _title: String!
    var _voteRating: Double!
    var _plot: String!
    var _posterURL: String!
    var _movieId: Int!
    
    
    
    var title: String {
        
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var voteRating: Double {
        if _voteRating == nil {
            _voteRating = 0.0
        }
        return _voteRating
    }
    
    var plot: String {
        
        if _plot == nil {
            _plot = ""
        }
        return _plot
    }
    
    
    var posterURL: String {
        if _posterURL == nil {
            _posterURL = ""
        }
        return _posterURL
    }

    
    var movieId: Int {
        if _movieId == nil {
            _movieId = 0
        }
        return _movieId
    }
    
   
    init(filmsDict: Dictionary<String, AnyObject>) {
      
        
        if let title = filmsDict["original_title"] as? String {
            self._title = title.capitalized
            print(self._title)
        }
        if let vote = filmsDict["vote_average"] as? Double {
            self._voteRating = vote
            print(self._voteRating)
        }
        
        if let plot = filmsDict["overview"] as? String {
            self._plot = plot.capitalized
            print(self._plot)
        }
        
        if let photo = filmsDict["poster_path"] as? String {
            self._posterURL = "\(BASE_URL_FOR_IMAGE)\(photo)"
            print(self._posterURL)
        }
        
        if let id = filmsDict["id"] as? Int {
            self._movieId = id
            print(self._movieId)
        }
    
    }
    
    
 
}
