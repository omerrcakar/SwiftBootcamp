//
//  PhoneDaoRepository.swift
//  phoneBook
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation
import RxSwift

class PhoneDaoRepository{
    
    var kisilerListesi = BehaviorSubject<[Phone]>(value: [Phone]())
    
    func saveData(name: String, no: String) {
        print("Name : \(name) - No : \(no)")
    }
    
    func updatePerson(person_id: Int, person_name: String, person_no: String) {
        print("Update! \(person_id) \(person_name) \(person_no)")
    }
    
    func delete(kisi_id: Int){
        print("Kisi Sil: \(kisi_id)")
        kisileriYukle()
    }
    
    func ara(aramaKelimesi:String){
        print("Search : \(aramaKelimesi)")
    }
    
    
    func kisileriYukle(){
        var liste = [Phone]()
        let kisi1 = Phone(kisi_id: 1, kisi_ad: "Max", kisi_tel: "1111")
        let kisi2 = Phone(kisi_id: 2, kisi_ad: "Kate", kisi_tel: "2222")
        let kisi3 = Phone(kisi_id: 3, kisi_ad: "Jimmy", kisi_tel: "3333")
        
        liste.append(kisi1)
        liste.append(kisi2)
        liste.append(kisi3)
        kisilerListesi.onNext(liste)
    }
}
