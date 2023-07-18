//
//  HomeCollectionViewCell.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var relaseDateLabel: UILabel!

    
    func configure(movieResult: MovieResult?){
        
        let path = movieResult?.posterPath ?? ""
        let fullImageUrl = URLConstants.baseURLImage.rawValue + path
        
        imageView.kfImage(url: fullImageUrl)
        
        movieNameLabel.text = movieResult?.originalTitle
        relaseDateLabel.text = movieResult?.releaseDate
        
    }
}
