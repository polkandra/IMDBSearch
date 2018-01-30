//
//  DetailCell.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 30.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class DetailCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genre1Label: UILabel!
    @IBOutlet weak var genre2Label: UILabel!
    @IBOutlet weak var genre3Label: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var productionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    var movie: MovieDetails!
    
    
    func configureCell(_ movie: MovieDetails) {
       self.movie = movie
    
        titleLabel.text = self.movie.title.capitalized
        genre1Label.text = self.movie.genre1.capitalized
        genre2Label.text = self.movie.genre2.capitalized
        genre3Label.text = self.movie.genre3.capitalized
        durationLabel.text = "\(self.movie.duration)"
        dateLabel.text = self.movie.date
        countryLabel.text = self.movie.country.capitalized
        ratingLabel.text = "\(self.movie.rating)"
        directorLabel.text = self.movie.director.capitalized
        productionLabel.text = self.movie.production.capitalized
        languageLabel.text = self.movie.language.capitalized
        discriptionLabel.text = self.movie.description
       
        let strURL = URL (string: self.movie.posterURL)
        
        if strURL == nil {
            posterImage.image = UIImage (named: "empty")
        }else{
            posterImage.af_setImage(withURL: strURL!)
        }
        
    }
   
    
}
