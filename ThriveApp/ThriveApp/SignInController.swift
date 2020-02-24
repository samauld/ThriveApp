//
//  SignInController.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 2/24/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

func signUpAuthentication(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        print("created");
    }
}

func signInAuthentication(email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        print("worked");
    }
}
