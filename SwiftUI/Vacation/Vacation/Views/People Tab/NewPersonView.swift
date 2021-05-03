//
//  NewPersonView.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 05. 02..
//

import SwiftUI

struct NewPersonView: View {
    
    @StateObject private var peopleViewModel = PeopleViewModel()
    @State private var personName = String()
    @State private var carriedOver = Int()
    @State private var newVacation = Int()
    @State private var taken = Int()
    
    @Environment(\.presentationMode) var presentation
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack {
            TextField("Name", text: $personName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Carried over days...", value: $carriedOver, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("New vacation days...", value: $newVacation, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Already taken...", value: $taken, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
 
            Button(!peopleViewModel.isCompleted ? "Save" : "Back") {
                !peopleViewModel.isCompleted ?
                    peopleViewModel.addData(personName: personName, carriedOver: carriedOver, newVacation: newVacation, taken: taken)
                    :
                    presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct NewPersonView_Previews: PreviewProvider {
    static var previews: some View {
        NewPersonView()
    }
}
