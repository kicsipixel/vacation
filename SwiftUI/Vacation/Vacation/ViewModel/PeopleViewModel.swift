//
//  PeopleViewModel.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 30..
//

import SwiftUI

class PeopleViewModel: ObservableObject {
    
    @Published var people: [PersonViewModel] = []
    private let api: String = "https://apex.oracle.com/pls/apex/vacation/api/v1/people/"
    
    func getData() {
        let apiService = APIService.shared
        apiService.getJSON(urlString: "\(api)") { (result: Result<People, APIService.APIError>) in
            
            switch result {
            case .success(let person):
                DispatchQueue.main.async {
                    self.people = person.items.map { PersonViewModel(person: $0) }
                }
            case .failure(let apiError):
                switch apiError {
                case .error(let errorString):
                    print(errorString)
                }
            }
        }
    }
}



