//
//  PhoneDaoRepository.swift
//  phoneBook
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation
import RxSwift
import Alamofire

class PhoneDaoRepository{
    
    var kisilerListesi = BehaviorSubject<[Phone]>(value: [Phone]())
    
    func saveData(name: String, no: String) {
        
        let params:Parameters = ["kisi_ad":name,"kisi_tel":no]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post, parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    
    func updatePerson(person_id: Int, person_name: String, person_no: String) {
        let params:Parameters = ["kisi_id":person_id,"kisi_ad":person_name,"kisi_tel":person_no]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post, parameters: params).response{ response in
             if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete(kisi_id: Int){
        let params:Parameters = ["kisi_id":kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post, parameters: params).response{ response in
             if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    self.kisileriYukle()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func ara(aramaKelimesi:String){
        
        let params:Parameters = ["kisi_ad":aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post,parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler{
                        self.kisilerListesi.onNext(liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func kisileriYukle(){
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler{
                        self.kisilerListesi.onNext(liste)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}
