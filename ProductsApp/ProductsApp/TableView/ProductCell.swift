
import UIKit


protocol CellProtocol{
    func clickedButton(indexPath: IndexPath)
}

class ProductCell: UITableViewCell {

    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    var hucreProtokol: CellProtocol?
    var indexPath: IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // burdaki butona tıklayınca bu işlem ana sayfada gerçekleşsin istiyoruz
    // burdan anasayfaya erişmek için protokol kullan
    // Burada tetiklenecek , anasayfada kullanılacak
    // hucre protokolu ve index path değeri ile burada tetiklenecek ve anasayfa üzerinde kullanabileceğiz
    // yani 2 sayfa arası etkileşimi sağladık
    @IBAction func addToCartButton(_ sender: UIButton) {
        hucreProtokol?.clickedButton(indexPath: indexPath!)
    }
    

}
