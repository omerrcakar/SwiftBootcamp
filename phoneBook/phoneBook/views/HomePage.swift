
import UIKit

class HomePage: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var phoneTableView: UITableView!
    
    var phonePersons = [Phone]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        phoneTableView.delegate = self
        phoneTableView.dataSource = self
        
        let kisi1 = Phone(kisi_id: 1, kisi_ad: "Max", kisi_tel: "1111")
        let kisi2 = Phone(kisi_id: 2, kisi_ad: "Kate", kisi_tel: "2222")
        let kisi3 = Phone(kisi_id: 3, kisi_ad: "Jimmy", kisi_tel: "3333")
        
        phonePersons.append(kisi1)
        phonePersons.append(kisi2)
        phonePersons.append(kisi3)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Ana sayfaya dönüldü")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let kisi = sender as? Phone{
                let gidilecekVC = segue.destination as! PhoneDetailScreen
                gidilecekVC.person = kisi
            }
        }
    }


}

extension HomePage: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search : \(searchText)")
    }
}


extension HomePage : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phonePersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = phonePersons[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "phoneBookCell") as! PhoneBookCell
        hucre.phoneName.text = kisi.kisi_ad
        hucre.phoneNo.text = kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = phonePersons[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (action, view, completionHandler) in
            let kisi = self.phonePersons[indexPath.row]
            let alert = UIAlertController(title: "Silmek istediğinize emin misiniz?", message: "\(kisi.kisi_ad!) kisisini silmek istediğinizden emin misiniz?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .default) { (action) in
                print("Kisi Sil: \(kisi.kisi_ad!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}


