//
//  PeopleListRowView.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 30..
//

import SwiftUI

struct PeopleListRowView: View {
    
    let person: PersonViewModel
    
    var body: some View {
        HStack {
            Text("\(person.name)")
            Spacer()
            Text("\(person.remaining)")
                .font(.footnote)
        }
    }
}
