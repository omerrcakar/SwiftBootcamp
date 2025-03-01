//
//  HomePageViewModel.swift
//  phoneBook
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation
import RxSwift


class HomePageViewModel{
    
    var krepo = PhoneDaoRepository()
    var kisilerListesi = BehaviorSubject<[Phone]>(value: [Phone]())
    
    init(){
        kisilerListesi = krepo.kisilerListesi
        kisileriYukle()
    }
    
    func delete(kisi_id: Int){
        krepo.delete(kisi_id: kisi_id)
    }
    
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle(){
        krepo.kisileriYukle()
    }
}
