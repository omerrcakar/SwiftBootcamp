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
    
    var viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        _ = viewModel.filmListesi.subscribe(onNext: { liste in
            self.movies = liste
            self.collectionView.reloadData()
        })
        
        
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
