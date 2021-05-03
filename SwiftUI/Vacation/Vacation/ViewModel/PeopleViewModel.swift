//
//  PeopleViewModel.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 30..
//

import SwiftUI

class PeopleViewModel: ObservableObject {
    
    @Published var people: [PersonViewModel] = []
    @Published var isCompleted = false
    // This can be on a better place
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
    
    func addData(personName: String, carriedOver: Int, newVacation: Int, taken: Int) {
        let apiService = APIService.shared
        apiService.postData(personName: personName, carriedOver: carriedOver, newVacation: newVacation, taken: taken) { (result: Result<People, APIService.APIError>) in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.isCompleted = true
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
