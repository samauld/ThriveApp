//
//  SignUpView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 2/16/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signUpAuthenticated: Bool = false
    
    func signUpAuthentication(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if (error == nil) {
                self.signInAuthorized = true
            }
        }
    }
    
    var body: some View {
        VStack{
            if !signUpAuthenticated{
                Text("Sign Up")
                    .font(.title)
                    .padding()
                TextField("Email", text: $email)
                    .padding(.all)
                    .frame(width: 300)
                SecureField("Password", text: $password)
                    .padding(.all)
                    .frame(width: 300)
                Button(action: {self.signUpAuthentication(email: self.email, password: self.password)}) {
                    Text("Create account")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
