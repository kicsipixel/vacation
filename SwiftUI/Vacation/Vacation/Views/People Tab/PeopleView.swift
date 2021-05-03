//
//  PeopleView.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 29..
//

import SwiftUI

struct PeopleView: View {
    
    @StateObject private var peopleViewModel = PeopleViewModel()
    @State private var isAddPresented = false
    
    var body: some View {
        NavigationView {
            VStack{
                if let people = peopleViewModel.people {
                    List {
                        ForEach(people, id:\.id) { person in
                            PeopleListRowView(person: person)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear(perform: {
                peopleViewModel.getData()
            })
            .navigationTitle(Text("People"))
            .navigationBarItems(trailing:
                                    NavigationLink(destination: NewPersonView()) {
                                        Text("Add")
                                    })
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
