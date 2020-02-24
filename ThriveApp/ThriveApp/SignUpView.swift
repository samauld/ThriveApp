//
//  SignUpView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 2/16/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack{
            Text("Sign Up")
                .font(.title)
                .padding()
            TextField("Email", text: $email)
                .padding(.all)
                .frame(width: 300)
            SecureField("Password", text: $password)
                .padding(.all)
                .frame(width: 300)
            Button(action: {signUpAuthentication(email: self.email, password: self.password)}) {
                Text("Create account")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
