//
//  DetailViewModel.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import Foundation
import UIKit

protocol DetailViewBusinessLogic{
    func didFinishGetMovieWithSuccess(movie: MovieDetails)
    func didFinishGetMovieWithError(error: Error)
}

class DetailViewModel {
    
    var delegate: DetailViewBusinessLogic?
    
    func getMovieDetails(idkey : String) {
        NetworkManager.shared.callService(with: .details(idKey: idkey)) { [weak self] (response: Result<MovieDetails, Error>) in
            switch response{
            case .success(let model):
                self?.delegate?.didFinishGetMovieWithSuccess(movie: model)
            case .failure(let failure):
                self?.delegate?.didFinishGetMovieWithError(error: failure)
            }
        }
    }
}
