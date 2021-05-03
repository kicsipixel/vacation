//
//  TestView.swift
//  Vacation
//
//  Created by Szabolcs Tóth on 2021. 05. 02..
//

import SwiftUI

struct TestView: View {
    
    @State private var score = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack {
            TextField("Amount to transfer", value: $score, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Your score was \(score).")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
