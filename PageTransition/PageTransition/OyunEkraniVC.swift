//
//  OyunEkraniVC.swift
//  PageTransition
//
//  Created by ÖMER  on 13.02.2025.
//

import UIKit

class OyunEkraniVC: UIViewController {
    
    var gelen_kisi: Kisiler?

    @IBOutlet weak var labelOyun: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ana sayfadan gelen mesajı aldık
        if let kisi = gelen_kisi{
            labelOyun.text = "\(kisi.email!)"
        }
    }
    

    @IBAction func geriButtonClicked(_ sender: UIButton) {
        // Nav içerisinde bir önceki sayfaya  geri gelme işlemi - salfa sol üstteki back butonu ile aynı işlem
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bitirButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "sonucGecis", sender: nil)
    }
    
}
