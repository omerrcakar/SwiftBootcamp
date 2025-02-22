//
//  MovieCell.swift
//  moviesCatalog
//
//  Created by ÖMER  on 22.02.2025.
//

import UIKit

protocol HucreProtokol{
    func sepeteEkle(indexPath: IndexPath)
}

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
  
    var hucreProtokol: HucreProtokol?
    var indexPath: IndexPath?
    
    // Bu buton hücrede , biz bunu ana sayfada çalıştırmak istiyoruz
    // 2 taraf arası iletişim için protokol kullanırız
    @IBAction func addButton(_ sender: UIButton) {
        hucreProtokol?.sepeteEkle(indexPath: indexPath!)
    }
    
    

}
