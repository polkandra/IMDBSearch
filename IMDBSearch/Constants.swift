//
//  Constants.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 28.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import Foundation


let BASE_URL_FOR_SEARCH = "https://api.themoviedb.org/3/search/movie?"
let BASE_URL_FOR_IMAGE = "https://image.tmdb.org/t/p/w500"
let BASE_URL_FOR_DETAILS = "https://api.themoviedb.org/3/movie/"

let API_KEY = "api_key=f1eb6f4ea7c46bf0534c42c1bd631176"
let API_KEY_FOR_DETAILS = "?api_key=f1eb6f4ea7c46bf0534c42c1bd631176"

let QUERY = "&query="

//let FULL_REQUEST = "\(BASE_URL_FOR_SEARCH)\(API_KEY)\(QUERY)Sex"





typealias DownloadCompleted = () -> ()





/*
https://api.themoviedb.org/3/search/movie?api_key=f1eb6f4ea7c46bf0534c42c1bd631176&query=Sex
*/

/*
https://image.tmdb.org/t/p/w500/iO4fslQ9CenAOcg3JfhN6o9va2.jpg
*/

/*
https://api.themoviedb.org/3/movie/109445?api_key=f1eb6f4ea7c46bf0534c42c1bd631176
*/
