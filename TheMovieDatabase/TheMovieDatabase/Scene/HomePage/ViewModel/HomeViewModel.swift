//
//  HomeViewModel.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import Foundation

protocol HomeViewBusinessLogic: AnyObject {
    func didFinishGetMovieWithSuccess()
    func didFinishGetMovieWithError(error: Error)
}

class HomeViewModel{
    var response: Search?
    var selectedMovie: MovieResult?
    var delegate: HomeViewBusinessLogic?
    
    var selectedId: Int?
    
    func searchMovies(query: String) {
        
        NetworkManager.shared.callService(with: .search(query: query)) { [weak self] (response: Result<Search, Error>) in
            switch response{
            case .success(let model):
                self?.response = model
                self?.delegate?.didFinishGetMovieWithSuccess()
            case .failure(let failure):
                self?.delegate?.didFinishGetMovieWithError(error: failure)
            }
        }
    }
    
}
    

