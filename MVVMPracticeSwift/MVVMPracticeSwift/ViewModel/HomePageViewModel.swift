//
//  HomePageViewModel.swift
//  MVVMPracticeSwift
//
//  Created by ÖMER  on 27.02.2025.
//

import Foundation
import RxSwift

class HomePageViewModel{
    
    // Repository'ye erişmek için bir nesne
    // bunula repodaki sonuca , fonksiyonlara erişebiliriz
    var mrepo = MatematikRepository()
    
    // Yönetilecek değer , okunacak değer
    // "0" varsayılan değeridir
    var sonuc = BehaviorSubject<String>(value: "0")
    
    // bu class'tan bir nesne oluşturduğumuz zaman
    // burdaki sonuc değerine = mrepodaki sonucu eşitliyorum
    // repodaki sonuç tetiklenince önce view modeldeki sonuca bağlanıcak ve view modeldeki sonucu tetikliyicek
    // sonra o sonuc da viewcontrollerdaki sonucu tetikliyicek ve veri değişimini gerçekleştirmiş olucak
    init(){
        sonuc = mrepo.sonuc
    }
    
    
    // burda işlem yaptırma yönetimi yapıcaz , işlemler repoda yapılacak ve sonuc değeri geri gelerek taşınacak view controllere a
    func toplama(tf1:String, tf2:String){
        mrepo.toplama(tf1: tf1, tf2: tf2)
    }
    
    func carpma(tf1:String, tf2:String){
        mrepo.carpma(tf1: tf1, tf2: tf2)
    }
}
