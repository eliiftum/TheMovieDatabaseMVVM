//
//  DetailViewModel.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import Foundation
import UIKit

class DetailViewModel: UIViewController{
    
    var response: [MovieResult]?
    var delegate: HomeViewBusinessLogic?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getMovieDetails(idkey : String) {
        NetworkManager.shared.callService(with: .details(idKey: idkey)) { [weak self] (response: Result<Search, Error>) in
            switch response{
            case .success(let model):
                self?.response = model.results
                self?.delegate?.didFinishGetMovieWithSuccess()
            case .failure(let failure):
                self?.delegate?.didFinishGetMovieWithError(error: failure)
            }
        }
    }
}
