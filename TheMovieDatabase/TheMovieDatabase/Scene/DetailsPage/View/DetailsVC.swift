//
//  DetailsVC.swift
//  TheMovieDatabase
//
//  Created by Elif Tum on 5.07.2023.
//

import Foundation
import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var averageLbl: UILabel!
    
    var selectedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func loadViews() {
        
    }
    
}
