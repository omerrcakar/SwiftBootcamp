//
//  DetailScreenViewModel.swift
//  phoneBook
//
//  Created by ÖMER  on 1.03.2025.
//

import Foundation


class DetailScreenViewModel{
    
    var krepo = PhoneDaoRepository()
    
    func updatePerson(person_id: Int, person_name: String, person_no: String) {
        krepo.updatePerson(person_id: person_id, person_name: person_name, person_no: person_no)
    }
}
