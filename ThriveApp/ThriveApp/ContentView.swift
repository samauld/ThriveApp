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
        NavigationView {
            VStack {
                Image("cropped").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                Text("Thrive")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(5)
                Text("Thriving on the Spectrum")
                    .font(.title)
                    .padding(5)
                NavigationLink(destination: SignInView() ) {
                    Text("Sign In")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.blue, width: 5)
                }.padding()
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.blue, width: 5)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
