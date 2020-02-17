//
//  ContentView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 1/31/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        Text("Thrive")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(5)
        Text("Thriving on the Spectrum")
            .font(.title)
                .padding(5)
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Sign In")
            .foregroundColor(.blue)
            .font(.title)
            .padding()
            .border(Color.blue, width: 5)
            }.padding()
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Sign Up")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
