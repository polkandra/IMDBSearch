//
//  MovieCell.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 28.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//

import UIKit
import AlamofireImage


class MovieCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var plotLabel: UILabel!
    

    var movie: Movie!
   
    
    func configureCell (_ movie: Movie) {
        self.movie = movie
        
        titleLabel.text = self.movie.title.capitalized
        countryLabel.text = "\(self.movie.voteRating)"
        plotLabel.text = self.movie.plot.capitalized
        
        
        let strURL = URL (string: self.movie.posterURL)
       
        if strURL == nil {
            posterImage.image = UIImage (named: "empty")
        }else{
            posterImage.af_setImage(withURL: strURL!)
        }
        
    }

}
