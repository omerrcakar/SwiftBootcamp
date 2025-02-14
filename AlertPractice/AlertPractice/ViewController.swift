//
//  ViewController.swift
//  AlertPractice
//
//  Created by ÖMER  on 14.02.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "Hello, World!", preferredStyle: .alert)
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            print("İptal")
        }
        
        alertController.addAction(iptalAction)
        self.present(alertController, animated: true)
    }
    
    
    @IBAction func actionSheet(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "Hello, World!", preferredStyle: .actionSheet)
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            print("İptal")
        }
        
        alertController.addAction(iptalAction)
        self.present(alertController, animated: true)
    }
    
    @IBAction func customAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "Hello, World!", preferredStyle: .alert)
        
        
        alertController.addTextField { textField in
            textField.placeholder = "Veri Giriniz"
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true
        }
        
        let tamamAction = UIAlertAction(title: "Kaydet", style: .cancel){ action in
            let tf = alertController.textFields![0] as UITextField
            if let alinanVeri = tf.text{
                print(alinanVeri)
            }
        }
        
        alertController.addAction(tamamAction)
        
        self.present(alertController, animated: true)
    }
    
}

