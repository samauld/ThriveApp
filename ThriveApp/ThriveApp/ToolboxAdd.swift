//
//  ToolboxAdd.swift
//  ThriveApp
//
//  Created by Sam Auld on 4/12/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ToolboxAdd: View {
    @State private var title: String = ""
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    
    var body: some View {
        Form {
            Section(header: Text("Tool Name")) {
                TextField("Tool Name", text: $title)
            }
            Button(action: writeTool) {
                Text("Save tool")
            }
            .navigationBarTitle("Add New Tool")
        }
    }
    
    func writeTool() {
        if title != "" {
            print("tool added")
            db.collection("regulation-tasks").addDocument(data: [ "USER": "me", "TOOL": title, "CHILD": "childName"])
            title = ""
        }
    }
}

struct ToolboxAdd_Previews: PreviewProvider {
    static var previews: some View {
        ToolboxAdd()
    }
}
