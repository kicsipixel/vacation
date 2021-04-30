//
//  PersonViewModel.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 30..
//

import Foundation

struct PersonViewModel {
    
    let person: People.Item
    
    var id: Int {
        return person.id
    }
    
    var name: String {
        return person.name
    }
    
    var remaining: Int {
        return person.remaining
    }
}
