//
//  OyunEkraniVC.swift
//  PageTransition
//
//  Created by ÖMER  on 13.02.2025.
//

import UIKit

class OyunEkraniVC: UIViewController {

    @IBOutlet weak var labelOyun: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func geriButtonClicked(_ sender: UIButton) {
        // Nav içerisinde bir önceki sayfaya  geri gelme işlemi - salfa sol üstteki back butonu ile aynı işlem
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bitirButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "sonucGecis", sender: nil)
    }
    
}
