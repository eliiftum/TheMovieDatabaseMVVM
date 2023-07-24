//
//  DetailsVC.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import Foundation
import UIKit

class DetailsVC: UIViewController {
    
    let viewModel = DetailViewModel()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var averageLbl: UILabel!
    
    var selectedId: Int?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        if let selectedId = selectedId {
            viewModel.getMovieDetails(idkey: String(selectedId))
        }
    }
    
    func configure(movieResult: MovieDetails?){
        
        let path = movieResult?.posterPath ?? ""
        let fullImageUrl = URLConstants.baseURLImage.rawValue + path
        
        imageView.kfImage(url: fullImageUrl)
        
        movieNameLabel.text = movieResult?.originalTitle
        descriptionLabel.text = movieResult?.overview
        
        if let popularity = movieResult?.popularity{
            popularityLabel.text = String(popularity)}
        
        if let average = movieResult?.voteAverage{
            averageLbl.text = String(average)
        }
    
    }
}

extension DetailsVC: DetailViewBusinessLogic{
    
    func didFinishGetMovieWithSuccess(movie: MovieDetails) {
        DispatchQueue.main.async{
            self.configure(movieResult: movie)
        }
    }
    
    func didFinishGetMovieWithError(error: Error) {
        print(error.localizedDescription)

    }
    
}
