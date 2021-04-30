//
//  PeopleView.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 29..
//

import SwiftUI

struct PeopleView: View {
    
    @StateObject private var peopleViewModel = PeopleViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let people = peopleViewModel.people {
                    List(people, id:\.id) { person in
                        PeopleListRowView(person: person)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle(Text("People"))
        }
        .onAppear(perform: {
            peopleViewModel.getData()
        })
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
