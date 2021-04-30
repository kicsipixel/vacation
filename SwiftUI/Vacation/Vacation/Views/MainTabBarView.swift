//
//  MainTabBarView.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 04. 29..
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView {
            PeopleView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("People")
                }
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
