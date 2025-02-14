 //
//  ViewController.swift
//  PageTransition
//
//  Created by ÖMER  on 13.02.2025.
//

import UIKit

class AnasayfaVC: UIViewController {

    
    
    @IBOutlet weak var labelAnasayfa: UILabel!
    
    // Uygulama ilk açıldığında çalışır ( 1 kere )
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func yapButtonClicked(_ sender: UIButton) {
        labelAnasayfa.text = "Merhaba"
    }
    

    @IBAction func baslaButtonClicked(_ sender: UIButton) {
        // Geçişi Tetikliyor perform segue ile ancak bu geçişi yakalamamız gerekiyor
        // burdaki sender ile veri gönderiyoruz geçiş için , bu veriyi prepare fonksiyonundaki sendar alıcak
        let gönderilenKisi = Kisiler(email: "omer@gmail.com", sifre: "1234")
        performSegue(withIdentifier: "oyunGecis", sender: gönderilenKisi)
    }
    
    // Geçişleri dinleriz , bu sayfa üzerindeki tüm geçişleri dinliyor
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Geçiş filtreleme
        if segue.identifier == "oyunGecis"{
            print("Oyun ekrani geçiş çalıştı")
            
            // perform segue den gelen veriyi buradaki sender dinliyor
            // Downcasting yaparak Any den String( gelen veri türü) ne çevirdik
            if let veri = sender as? Kisiler{
                
                
                // Mesajın gönderilecek VC'sine erişip downcasting yaptık
                // o ekrandaki gelen mesaj değerine bizim verimizi koyduk
                let gidilecekVC = segue.destination as! OyunEkraniVC
                gidilecekVC.gelen_kisi = veri
            }
        }
    }
    
}

