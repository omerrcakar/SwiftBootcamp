//
//  Movies.swift
//  moviesCatalog
//
//  Created by ÖMER  on 22.02.2025.
//

import Foundation

class Movies{
    var id:Int?
    var ad:String?
    var resim:String?
    var fiyat:Double?
    
    init(){
        
    }
    
    
    init(id: Int, ad: String, resim: String, fiyat: Double) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
}
