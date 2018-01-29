//
//  Constants.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 28.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import Foundation


let BASE_URL = "https://api.themoviedb.org/3/search/movie?"
let API_KEY = "api_key=f1eb6f4ea7c46bf0534c42c1bd631176"
let QUERY = "&query="

let FULL_REQUEST = "\(BASE_URL)\(API_KEY)\(QUERY)Sex"

let BASE_URL_FOR_IMAGE = "https://image.tmdb.org/t/p/w500"



typealias DownloadCompleted = () -> ()





/*
https://api.themoviedb.org/3/search/movie?api_key=f1eb6f4ea7c46bf0534c42c1bd631176&query=Sex
*/

/*
https://image.tmdb.org/t/p/w500/iO4fslQ9CenAOcg3JfhN6o9va2.jpg
*/
