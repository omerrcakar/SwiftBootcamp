//
//  SonucekraniVC.swift
//  PageTransition
//
//  Created by ÖMER  on 13.02.2025.
//

import UIKit

class SonucEkraniVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kapatButtonClicked(_ sender: UIButton) {
        // Tamamen ana sayfaya döner
        navigationController?.popToRootViewController(animated: true)
        
        // Eğer modal segue olsaydı
        // self.dismiss(animated: true)
    }
    

}
