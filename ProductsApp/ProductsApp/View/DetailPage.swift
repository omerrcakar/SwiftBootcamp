//
//  DetailPage.swift
//  ProductsApp
//
//  Created by ÖMER  on 20.02.2025.
//

import UIKit

class DetailPage: UIViewController {
    
    var comingProduct: Product?
    
    @IBOutlet weak var comingImage: UIImageView!
    @IBOutlet weak var comingPrice: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = comingProduct {
            comingImage.image = UIImage(named: product.resim!)
            comingPrice.text = "\(product.fiyat!)"
        
            // change navigation title
            self.navigationItem.title = product.ad!
        }
    }
    

    
    @IBAction func comingButton(_ sender: UIButton) {
        if let product = comingProduct{
            print("Product Added: \(product.ad!)")
        }
    }
    

}
