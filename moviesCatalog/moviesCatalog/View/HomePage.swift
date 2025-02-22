//
//  ViewController.swift
//  moviesCatalog
//
//  Created by ÖMER  on 22.02.2025.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let m1 = Movies(id: 1, ad: "Django", resim: "django", fiyat: 155)
        let m2 = Movies(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 275)
        let m3 = Movies(id: 3, ad: "Inception", resim: "inception", fiyat: 345)
        let m4 = Movies(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 295)
        let m5 = Movies(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 500)
        let m6 = Movies(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 125)
        movies = [m1,m2,m3,m4,m5, m6]
        
        
        // Screen size design
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30)/2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.7)
        
        collectionView.collectionViewLayout = design
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let sendingData = sender as? Movies{
                let destinationVC = segue.destination as! DetailPage
                destinationVC.comingMovie = sendingData
            }
        }
    }


}

extension HomePage: UICollectionViewDataSource, UICollectionViewDelegate, HucreProtokol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! MovieCell
        cell.imageView.image = UIImage(named: movie.resim!)
        cell.imageView.layer.cornerRadius = 15
        cell.imageView.clipsToBounds = true
        cell.imageView.contentMode = .scaleAspectFill
        
        
        cell.priceLabel.text = "\(movie.fiyat!) ₺"
        
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        
        // Protokol
        cell.hucreProtokol = self
        cell.indexPath = indexPath
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: movie)
    }
    
    func sepeteEkle(indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        if let gelenFilmAd = movie.ad{
            print("Sepete Eklendi: \(gelenFilmAd)")
        }
        
    }
}
