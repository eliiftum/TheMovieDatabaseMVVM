//
//  ViewController.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import UIKit

class HomeVC: UIViewController{
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var homeViewModel = HomeViewModel()
    var movieTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        self.title = "Movie Search"
        
        homeViewModel.delegate = self
        
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
        guard let movie = homeViewModel.response?.results else{return 0}
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell

        let movie = homeViewModel.response?.results?[indexPath.row]
        cell.configure(movieResult: movie)
        
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedId = homeViewModel.response?.results?[indexPath.row].id {
            homeViewModel.selectedId = selectedId
            performSegue(withIdentifier: "toDetailsVC", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
               
               if let destination = segue.destination as? DetailsVC{
                   destination.selectedId = homeViewModel.selectedId
               }
           }
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    
}

extension HomeVC: HomeViewBusinessLogic{
    func didFinishGetMovieWithSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFinishGetMovieWithError(error: Error) {
        print(error.localizedDescription)
    }
}

extension HomeVC: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text{
            homeViewModel.searchMovies(query: text)

        }
    }
}
