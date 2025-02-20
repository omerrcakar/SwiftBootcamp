//
//  ViewController.swift
//  ProductsApp
//
//  Created by ÖMER  on 20.02.2025.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTableView.delegate = self
        productTableView.dataSource = self
        
        let p1 = Product(id: 1, ad: "Macbook Pro", resim: "bilgisayar", fiyat: 36.999)
        let p2 = Product(id: 2, ad: "Iphone 14", resim: "telefon", fiyat: 28.000)
        let p3 = Product(id: 3, ad: "Rayban Wayfarer", resim: "gozluk", fiyat: 1.999)
        let p4 = Product(id: 4, ad: "JBL", resim: "kulaklik", fiyat: 1.999)
        let p5 = Product(id: 5, ad: "Bargello 696", resim: "parfum", fiyat: 0.999)
        let p6 = Product(id: 6, ad: "Apple Watch", resim: "saat", fiyat: 2.999)
        let p7 = Product(id: 7, ad: "Dyson Air", resim: "supurge", fiyat: 3.999)
        
        
        products.append(contentsOf: [p1,p2,p3,p4,p5,p6,p7])
        
        productTableView.separatorColor = .clear
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let data = sender as? Product{
                let destinationVC = segue.destination as! DetailPage
                destinationVC.comingProduct = data
            }
        }
    }


}

extension HomePage: UITableViewDataSource, UITableViewDelegate, CellProtocol{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductCell
        
        cell.productImage.image = UIImage(named: product.resim!)
        cell.productName.text = product.ad
        cell.productPrice.text = "\(product.fiyat!) ₺"
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.productImage.layer.cornerRadius = 15
        
        // protocol erişimleri
        cell.hucreProtokol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: product)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let product = products[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            print("Silinecek Product: \(product.ad!)")
        }
        
        let updateAction = UIContextualAction(style: .normal, title: "Update") { (action, view, completionHandler) in
            print("Düzenlenecek Product: \(product.ad!)")
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, updateAction])
    }
    
    func clickedButton(indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("Selected Product: \(product.ad!)")
    }
}

