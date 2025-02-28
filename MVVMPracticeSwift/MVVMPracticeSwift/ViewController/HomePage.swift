//
//  ViewController.swift
//  MVVMPracticeSwift
//
//  Created by ÖMER  on 27.02.2025.
//

import UIKit

class HomePage: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var tfFirstNum: UITextField!
    @IBOutlet weak var tfSecondNum: UITextField!
    
    var viewModel = HomePageViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sonuc değerinin gözlemlendiği , değişiklik oldugu zaman dinlendiği yer
        // sonuç değerinin dinlendiği kısım
        // s = view model -> repositorydeki sonuc değerini dönecek
        _ = viewModel.sonuc.subscribe(onNext: { s in
            self.resultLabel.text = s
        })
    }
    
    
    @IBAction func plusButton(_ sender: UIButton) {
        if let tf1 = tfFirstNum.text, let tf2 = tfSecondNum.text {
            viewModel.toplama(tf1: tf1, tf2: tf2)
            
            
        }
        
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        if let tf1 = tfFirstNum.text, let tf2 = tfSecondNum.text {
            viewModel.carpma(tf1: tf1, tf2: tf2)
            
        }
    }
    
    


}

