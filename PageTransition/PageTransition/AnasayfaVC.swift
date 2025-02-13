 //
//  ViewController.swift
//  PageTransition
//
//  Created by ÖMER  on 13.02.2025.
//

import UIKit

class AnasayfaVC: UIViewController {

    
    
    @IBOutlet weak var labelAnasayfa: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func yapButtonClicked(_ sender: UIButton) {
        labelAnasayfa.text = "Merhaba"
    }
    

    @IBAction func baslaButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "oyunGecis", sender: nil)
    }
    
}

