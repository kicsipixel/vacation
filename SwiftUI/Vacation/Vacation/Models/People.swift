//
//  People.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 30..
//

import Foundation

struct People: Codable {
    struct Item: Codable, Identifiable {
        var id: Int?
        var pname: String?
        var carriedOver: Int?
        var newVacation: Int?
        var taken: Int?
        var remaining: Int?
        
        enum CodingKeys: String, CodingKey {
            case id
            case pname
            case carriedOver = "carried_over_days"
            case newVacation = "new_vacation_days"
            case taken
            case remaining
        }

    }
    var items: [Item]
}


