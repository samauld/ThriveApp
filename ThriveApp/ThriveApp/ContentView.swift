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
                        .foregroundColor(.white)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: 200)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("ThriveBlue"), Color(red: 3/255, green: 161/255, blue: 235/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)

                }.padding()
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: 200)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("ThriveBlue"), Color(red: 3/255, green: 161/255, blue: 235/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                }
                NavigationLink(destination: ChildProfileView()) {
                    Text("Testing")
                        .foregroundColor(.white)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: 200)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color("ThriveBlue"), Color(red: 3/255, green: 161/255, blue: 235/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                }.padding()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
