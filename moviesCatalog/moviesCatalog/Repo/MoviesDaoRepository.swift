//
//  MoviesDaoRepository.swift
//  moviesCatalog
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation
import RxSwift

class MoviesDaoRepository{
    // arayüzü tetikleyecek , nesen taşıyacak yapı
    var filmListesi = BehaviorSubject<[Movies]>(value: [Movies]())
    
    func uploadMovies(){
        var liste = [Movies]()
        let m1 = Movies(id: 1, ad: "Django", resim: "django", fiyat: 155)
        let m2 = Movies(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 275)
        let m3 = Movies(id: 3, ad: "Inception", resim: "inception", fiyat: 345)
        let m4 = Movies(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 295)
        let m5 = Movies(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 500)
        let m6 = Movies(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 125)
        liste = [m1,m2,m3,m4,m5, m6]
        filmListesi.onNext(liste)
    }
    
}
