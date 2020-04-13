//
//  ToolboxView.swift
//  ThriveApp
//
//  Created by Sam Auld on 3/29/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ToolboxView: View {
    @State private var user = Auth.auth().currentUser
    @State private var heartRate: Double = 70
    let db = Firestore.firestore()

    
    func readTools() {
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    var body: some View {
        NavigationView(){
            VStack{
                List{
                    HStack {
                        Image("toolbox").resizable()
                        .frame(width: 50, height: 50)
                    NavigationLink(destination:ToolDetailView()){
                            Text("Blow Bubbles")
                        }.multilineTextAlignment(.leading)
                        //Have some sort of indication for what tool is active
                        //Image("notification").resizable().frame(width: 50, height: 50)
                    }
                }
                Button(action: {self.readTools()}) {
                    Text("debug")
                }
                HStack {
                    Text("Heartrate")
                    Slider(value: $heartRate, in: 70...100, step:1.0)
                    Text("\(heartRate, specifier: "%.0f")")
                }.padding()
                NavigationLink(destination: ToolboxAdd()){
                   Text("+ Add Regulation Tool")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.blue, width: 4)
                }
                .padding(.top)
            }
            .navigationBarTitle(Text("Child Name's Toolbox"))
        }
    }
}

struct ToolboxView_Previews: PreviewProvider {
    static var previews: some View {
        ToolboxView()
    }
}
