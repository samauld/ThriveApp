//
//  SignInView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 2/16/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State var signInAuthorized: Bool = false

    func signInAuthentication(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            self.signInAuthorized = true
        }
    }
    
    var body: some View {
        VStack{
            if !self.signInAuthorized{
                Text("Sign In")
                    .font(.title)
                    .padding()
                TextField("Username", text: $username)
                    .padding(.all)
                    .frame(width: 300)
                SecureField("Password", text: $password)
                    .padding(.all)
                    .frame(width: 300)
                Button(action: {self.signInAuthentication(email: self.username, password: self.password)}) {
                    Text("Sign In")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.blue, width: 5)
                    
                }
            }
            else {
                ChildProfileView()
            }
            
            }
        
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
