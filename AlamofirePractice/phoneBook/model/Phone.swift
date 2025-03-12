//
//  Phone.swift
//  phoneBook
//
//  Created by ÖMER  on 18.02.2025.
//

import Foundation

class Phone: Codable{
    var kisi_id:String?
    var kisi_ad:String?
    var kisi_tel:String?
    
    init(){
        
    }
    
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}


class KisilerCevap: Codable{
    var kisiler: [Phone]?
    var success:Int?
}
