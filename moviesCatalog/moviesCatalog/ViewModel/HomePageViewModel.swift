//
//  HomePageViewModel.swift
//  moviesCatalog
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation
import RxSwift

class HomePageViewModel{
    var filmListesi = BehaviorSubject<[Movies]>(value: [Movies]())
    
    var krepo = MoviesDaoRepository()
    
    init(){
        filmListesi = krepo.filmListesi
        uploadMovies()
    }
    
    func uploadMovies(){
        krepo.uploadMovies()
    }
    
}
