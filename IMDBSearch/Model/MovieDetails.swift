//
//  MovieDetails.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 30.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage



class MovieDetails {
    
    var _title: String!
    var _genre1: String!
    var _genre2: String!
    var _genre3: String!
    var _duration: Int!
    var _date: String!
    var _country: String!
    var _rating: Double!
    var _director: String!
    var _production: String!
    var _language: String!
    var _description: String!
    var _posterURL: String!
    
   
    var posterURL: String {
        if _posterURL == nil {
            _posterURL = ""
        }
        return _posterURL
    }
    
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    
    var language: String {
        if _language == nil {
            _language = ""
        }
        return _language
    }
    
   
    
    var production: String{
        if _production == nil {
            _production = ""
        }
        return _production
    }
    
   
    
    var director: String {
        if _director == nil {
            _director = ""
        }
        return _director
    }
    
    
    
    var rating: Double {
        if _rating == nil {
            _rating = 0.0
        }
        return _rating
    }
    
    
    
    var country: String {
        if _country == nil {
            _country = ""
        }
        return _country
    }
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var duration: Int {
        if _duration == nil {
            _duration = 0
        }
        return _duration
    }
    
    var genre1: String {
        if _genre1 == nil{
            _genre1 = ""
        }
        return _genre1
    }
    
    var genre2: String {
        if _genre2 == nil{
            _genre2 = ""
        }
        return _genre2
    }
    
    
    var genre3: String {
        if _genre3 == nil{
            _genre3 = ""
        }
        return _genre3
    }

    
    var title: String {
        
        if _title == nil {
            _title = ""
        }
        return _title
    }

    init(filmDetailsDict: Dictionary<String, AnyObject>) {
        
        if let title = filmDetailsDict["original_title"] as? String {
            self._title = title
            print(self._title)
        }
    
   
        if let genres = filmDetailsDict["genres"] as? [Dictionary<String, AnyObject>] {
                    
            let intendedIndex0 = 0
            if (intendedIndex0 >= 0 && genres.count > intendedIndex0) {
                // This line will not throw index out of range:
                let existingIndex = genres[intendedIndex0]["name"]
                if let genre1 = existingIndex as? String {
                    self._genre1 = genre1
                    print(self._genre1)
                }
                
            }
            

            let intendedIndex1 = 1
            if (intendedIndex1 > 0 && genres.count > intendedIndex1) {
                // This line will not throw index out of range:
                let existingIndex = genres[intendedIndex1]["name"]
                if let genre2 = existingIndex as? String {
                    self._genre2 = genre2
                    print(self._genre2)
                }
                
            }
            
            let intendedIndex2 = 2
            if (intendedIndex2 > 0 && genres.count > intendedIndex2) {
                // This line will not throw index out of range:
                let existingIndex = genres[intendedIndex2]["name"]
                if let genre3 = existingIndex as? String {
                    self._genre3 = genre3
                    print(self._genre3)
                }
                
            }
            
        }

     
    
        if let duration = filmDetailsDict["runtime"] as? Int {
            //let finalString = "\(duration) min"
            self._duration = duration
            print(self._duration)
        }
    
        if let date = filmDetailsDict["release_date"] as? String {
            self._date = date
            print(self._date)
        }
    
        if let countryOfProduction = filmDetailsDict["production_countries"] as? [Dictionary<String, AnyObject>] {
            let intendedIndex = 0
            if (intendedIndex >= 0 && countryOfProduction.count > intendedIndex) {
                // This line will not throw index out of range:
                let existingIndex = countryOfProduction[intendedIndex]["name"]
                if let country = existingIndex as? String {
                    self._country = country
                    print(self._country)
                }
            }
    
        if let rating = filmDetailsDict["popularity"] as? Double {
            self._rating = rating
            print(self._rating)
        }
    
    
        if let production = filmDetailsDict["production_companies"] as? [Dictionary<String, AnyObject>] {
            let intendedIndex = 0
            if (intendedIndex >= 0 && production.count > intendedIndex) {
                // This line will not throw index out of range:
                let existingIndex = production[intendedIndex]["name"]
                if let production = existingIndex as? String {
                    self._production = production
                    print(self._country)
                }
        }
       
        
        if let languageArray = filmDetailsDict["spoken_languages"] as? [Dictionary<String, AnyObject>] {
            let intendedIndex = 0
            if (intendedIndex >= 0 && languageArray.count > intendedIndex) {
                // This line will not throw index out of range:
                let existingIndex = languageArray[intendedIndex]["name"]
                if let language = existingIndex as? String {
                    self._language = language
                    print(self._language)
                }
   
        }
        
        if let desc = filmDetailsDict["overview"] as? String {
            self._description = desc
            print(self._description)
        }
        
        
        if let photo = filmDetailsDict["poster_path"] as? String {
            self._posterURL = "\(BASE_URL_FOR_IMAGE)\(photo)"
            print(self._posterURL)
        }
        
       
        
        
        // MARK: Second Request
        
//        if let filmDirector = filmsCrewDict["crew"] as? [Dictionary<String, AnyObject>] {
//            if let director = filmDirector[0]["job"] as? String {
//                self._director = director
//                print(self._director)
//            }
//
//        }
        
      
            
            
            
            }
            
            
            }
        }
    }
}




