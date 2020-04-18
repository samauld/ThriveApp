//
//  RewardBankView.swift
//  ThriveApp
//
//  Created by Emily Heckel on 3/21/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct RewardBankView: View {
    @State var count: Int = 0
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    
    func readTokens(){
        var docRef = db.collection("rewards").document(user?.uid ?? "");
        
        docRef.getDocument { (document, error) in
            if let document = document {
                if document.exists{
                    self.count=document.data()?["tokens"] as! Int
                }
                else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    func writeTokens(){
        db.collection("rewards").document(user?.uid ?? "" ).setData(["tokens": self.count])
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Tokens: \(count)")
                .font(.title)
            HStack {
                Button(action: {
                    self.count += 1
                    self.writeTokens()
                }) {
                    Text("Add token")
                }
                Button(action: {
                    if (self.count > 0) {
                        self.count -= 1
                    }
                    self.writeTokens()
                }) {
                    Text("Take away token")
                }
            }
        }
        .onAppear(perform: readTokens)
    }
}

struct RewardBankView_Previews: PreviewProvider {
    static var previews: some View {
        RewardBankView()
    }
}
