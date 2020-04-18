//
//  ScheduleDayAddActivity.swift
//  ThriveApp
//
//  Created by Emily Heckel on 4/12/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ScheduleDayEditActivity: View {
    @State private var title: String = ""
    @State private var newTask: String = ""
    @State private var id: Int = 0;
    @State private var start = Date()
    @State private var end = Date()
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    @State var event: Event
    @State var editedTask: Bool = false
    @Environment(\.presentationMode) var presentationMode
        
    func createDatePickers(){
        start = self.event.start
        end = self.event.end ?? Date()
    }
    

    var body: some View {
        Form{
                Section(header: Text("Activity Title")) {
                    TextField("\(event.title ?? "")", text: $title)
                }
                Section(header: Text("Activity Tasks")) {
                    List() {
                        ForEach(event.tasks, id: \.self) { task in
                           Text("\(task)")
                        }
                        .onDelete(perform: delete)
                    }
                    TextField("New task title", text: $newTask)
                    Button(action: addTask, label: { Text("Add task") })
                }
                Section(header: Text("Activity Times")){
                  
                    DatePicker("Start time", selection: $start, displayedComponents: .hourAndMinute)
                    DatePicker("End time", selection: $end, displayedComponents: .hourAndMinute)

                }
                Button(action: writeActivity) {
                    Text("Save changes")
                }
            .navigationBarTitle("Add New Activity")
        }.onAppear(perform: createDatePickers)
    }
    func addTask() {
        if newTask != "" {
            self.event.tasks.append(newTask)
            newTask = ""
            id = id + 1
        }
    }
    func delete(at offsets: IndexSet) {
        self.event.tasks.remove(atOffsets: offsets)
    }
    func writeActivity() {
        if newTask != "" {
            addTask()
        }
        if title != "" {
            self.event.title = title
        }
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        
        let time = "\(month)/\(day)/\(year) \(hour):\(minutes)"
        let collDay = "\(month).\(day).\(year)"
        
//        var taskArr: [String] = [];
//        for task in taskList {
//            taskArr.append(task.title)
//        }
        
        db.collection("schedules").document(user?.uid ?? "" ).collection(event.date ?? "").document(event.id)
            .setData([ "USER": "me", "EDITED": time, "TITLE": event.title, "TASKS": event.tasks, "START": start, "END": end]
                ) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added")
                    }
                }
        //title = ""
        //taskList = []
        //id = 0
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

struct ScheduleDayEditActivity_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleDayEditActivity(event: Event(tasks: [""], title: "", id: "", date: "", start: Date(), end: Date()))
    }
}
