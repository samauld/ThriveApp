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
        print(user?.uid ?? "")
        print(self.selectedDate)

        db.collection("schedules").document(user?.uid ?? "").collection(self.selectedDate).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.taskList.append(Event(tasks: document.data()["TASKS"] as! [String], title: document.data()["TITLE"] as! String, id: document.documentID, date: self.selectedDate, start: (document.data()["START"] as! Timestamp).dateValue(), end: (document.data()["END"] as! Timestamp).dateValue()))
                    print(document.data())
                }
            }
                
                }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.taskList = self.taskList.sorted { $0.start < $1.start }
        }
    }
        
    var body: some View {
        VStack{
            Text("\(selectedDate)")
                .font(.title)
                .padding()
            Divider()
            VStack {
                List {
                ForEach(taskList) { event in
                       EventView(event: event)
                    }
                }
            }
            
            Divider()
            Spacer()
            Divider()
            NavigationLink(destination: ScheduleDayAddActivity(savedDay: selectedDate)) {
                Text("+ Add Activity")
                .foregroundColor(.blue)
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding()
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
