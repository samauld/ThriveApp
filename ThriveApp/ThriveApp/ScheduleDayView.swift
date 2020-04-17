//
//  ScheduleDayView.swift
//  ThriveApp
//
//  Created by Danny Kaminsky on 3/1/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ScheduleDayView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    var selectedDate: String
    @State var taskList =  [Event]()
    
    func readSchedule() {
        taskList = [Event]()
        let docRef = db.collection("schedules").document(user?.uid ?? "");

        docRef.getDocument { (document, error) in
        if let document = document {
            //if document.exists{
            docRef.collection(self.selectedDate).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        self.taskList.append(Event(tasks: document.data()["TASKS"] as! [String], title: document.data()["TITLE"] as! String, id: document.documentID, date: self.selectedDate))
                        print(document.data())
                    }
                }
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
        
    var body: some View {
        VStack{
            Text("\(selectedDate)")
                .font(.title)
                .padding()
            Divider()
            //Spacer()
            VStack {
                List {
                ForEach(taskList) { event in
                       EventView(event: event)
                    }
                }
            }
            
            Divider()
            Spacer() //I think this is how to keep the button at the bottom
            Divider()
            NavigationLink(destination: ScheduleDayAddActivity(savedDay: selectedDate)) {
//            Button(action: {
//                let key: String = "Add activity button pressed"
//                print(key)
//            }) {
                Text("+ Add Activity")
                .foregroundColor(.blue)
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding()
                //.border(Color.blue, width: 5)
                .frame(width: 300, height: 60)
            }
        }
        .onAppear(perform: readSchedule)
    }

}

struct ScheduleDayView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleDayView(selectedDate: "Date()")
    }
}
