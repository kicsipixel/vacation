//
//  Response.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 05. 02..
//

// In case you want to see the POST response from the server but APEX now return the complete table
import Foundation

struct Response:Codable {
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

