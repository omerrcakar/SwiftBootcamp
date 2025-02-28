//
//  MatematikRepository.swift
//  MVVMPracticeSwift
//
//  Created by ÖMER  on 27.02.2025.
//

import Foundation
import RxSwift

class MatematikRepository{
    var sonuc = BehaviorSubject<String>(value: "0")
    
    func toplama(tf1:String, tf2:String){
        if let firstNum = Int(tf1), let secondNum = Int(tf2) {
            sonuc.onNext("\(firstNum + secondNum)")// Tetikleme yapacak ve bunu arayüzde dinlicez , gösterez
            // Sonuca bir değer aktardığımız zaman , nerede observe ediliyorsa nerede gözlemleniyorsa
            // orası anlık olarak çalışacak
            // sonuc değeri değiştiği zaman , ana saayfada dinlediğimiz yere veri gidiyor
        }
    }
    
    func carpma(tf1:String, tf2:String){
        if let firstNum = Int(tf1), let secondNum = Int(tf2) {
            sonuc.onNext("\(firstNum * secondNum)")// Tetikleme
        }
    }
}
