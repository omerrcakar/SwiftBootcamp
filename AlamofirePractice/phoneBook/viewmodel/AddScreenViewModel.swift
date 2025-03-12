//
//  AddScreenViewModel.swift
//  phoneBook
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation

class AddScreenViewModel{
    
    var krepo = PhoneDaoRepository()
    
    func saveData(name: String, no: String) {
        krepo.saveData(name: name, no: no)
    }
}
