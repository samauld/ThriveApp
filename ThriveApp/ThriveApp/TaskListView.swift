//
//  TaskListView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 4/16/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct TaskListView: View {
    @State var event: Event
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    @Environment(\.presentationMode) var presentationMode

    
    func resetTask() {
        let docRef = db.collection("schedules").document(user?.uid ?? "");
        let date = event.date

        docRef.getDocument { (document, error) in
        if let document = document {
            //if document.exists{
            docRef.collection(self.event.date ?? "").document(self.event.id).getDocument{ (document, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if let document = document {
                        self.event = Event(tasks: document.data()?["TASKS"] as! [String], title: document.data()?["TITLE"] as! String, id: document.documentID, date: date ?? "", start: (document.data()?["START"] as! Timestamp).dateValue(), end: (document.data()?["END"] as! Timestamp).dateValue())
                    }
                    
                }
                }
            }
            else {
                print("Document does not exist")
            }
        }
        
    }
    
    func removeTask(){
        db.collection("schedules").document(user?.uid ?? "").collection(self.event.date ?? "").document(self.event.id).delete(){ err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        
        self.presentationMode.wrappedValue.dismiss()

    }
    
    var body: some View {
        VStack{
            Text("\(event.title ?? "")")
                .font(.largeTitle)
                    .padding()
                Divider()
                VStack {
                    Text("Tasks").font(.title)
                    List {
                        ForEach(event.tasks, id: \.self) { task in
                           Text("\(task)")
                        }
                    }
                }
                
                Divider()
                Spacer() //I think this is how to keep the button at the bottom
                Divider()
            NavigationLink(destination: ScheduleDayEditActivity(event: event)) {
                    Text("Edit")
                    .foregroundColor(.blue)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding()
                    //.border(Color.blue, width: 5)
                    .frame(width: 300, height: 60)
                }
            Button(action: {self.removeTask()}) {
                    Text("Remove")
                    .foregroundColor(.blue)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding()
                    //.border(Color.blue, width: 5)
                    .frame(width: 300, height: 60)
            }
        }.onAppear(perform: resetTask)
    }
    }

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(event: Event(tasks: [""], title: "", id:"", date: "", start: Date(), end: Date()))
    }
}
