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
    @State var tools = [String]()
    
    
    func readTools() {
        //print(Auth.auth().currentUser)
        tools = [String]()
        
        let docRef = db.collection("regulation-tasks").document(user?.uid ?? "")
        
        docRef.getDocument { (document, err) in
            if let document = document {
                docRef.collection("tools").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            self.tools.append(document.data()["TOOL"] as! String)
                        }
                    }
                    
                }
            } else {
                print("Document does not exist")
            }
            
        }
    }
    
    var body: some View {
            VStack{
                List{
                    ForEach(tools, id: \.self) { tool in
                        HStack {
                            Image("toolbox").resizable()
                                .frame(width: 50, height: 50)
                            NavigationLink(destination:ToolDetailView()){
                                Text(tool)
                            }.multilineTextAlignment(.leading)
                        }
                    }
                }
                HStack {
                    Text("Heartrate")
                    Slider(value: $heartRate, in: 70...100, step:1.0)
                    Text("\(heartRate, specifier: "%.0f")")
                }.padding()
                NavigationLink(destination: ToolboxAdd()){
                    Text("+ Add Regulation Tool")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color("ThriveBlue"), Color(red: 3/255, green: 161/255, blue: 235/255)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
                .padding(.top)
            }
            .navigationBarTitle(Text("Child Name's Toolbox"))
            .onAppear(perform: readTools)
        }
    
}

struct ToolboxView_Previews: PreviewProvider {
    static var previews: some View {
        ToolboxView()
    }
}
