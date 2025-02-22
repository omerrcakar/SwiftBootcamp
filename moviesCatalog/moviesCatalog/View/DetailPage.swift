//
//  DetailPage.swift
//  moviesCatalog
//
//  Created by ÖMER  on 22.02.2025.
//

import UIKit

class DetailPage: UIViewController {
    
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePhoto: UIImageView!
    @IBOutlet weak var moviePrice: UILabel!
    
    
    var comingMovie: Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let comingMovie = comingMovie {
            if let fiyat = comingMovie.fiyat, let ad = comingMovie.ad, let resim = comingMovie.resim {
                movieName.text = ad
                moviePrice.text = "\(fiyat) ₺"
                moviePhoto.image = UIImage(named: resim)
            }
                        
        }
    }
    

   

}
