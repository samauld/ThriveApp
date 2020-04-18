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

struct ActivityTask: Identifiable {
    let id: Int
    let title: String
}

struct ScheduleDayAddActivity: View {
    @State private var title: String = ""
    @State private var newTask: String = ""
    @State private var id: Int = 0;
    @State private var start = Date()
    @State private var end = Date()
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    var savedDay: String
    
    @State var taskList: [ActivityTask] = []
    
    var body: some View {
        Form {
            Section(header: Text("Activity Title")) {
                TextField("Activity title", text: $title)
            }
            Section(header: Text("Activity Tasks")) {
                List() {
                    ForEach(taskList) { task in
                        Text(task.title)
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
        }
    }
    func addTask() {
        if newTask != "" {
            taskList.append(ActivityTask(id: id, title: newTask))
            newTask = ""
            id = id + 1
        }
    }
    func delete(at offsets: IndexSet) {
        taskList.remove(atOffsets: offsets)
    }
    func writeActivity() {
        if newTask != "" {
            addTask()
        }
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        
        let time = "\(month)/\(day)/\(year) \(hour):\(minutes)"
        
        var taskArr: [String] = [];
        for task in taskList {
            taskArr.append(task.title)
        }
        
        db.collection("schedules").document(user?.uid ?? "" ).collection(self.savedDay)
            .addDocument(data: [ "USER": "me", "EDITED": time, "TITLE": title, "TASKS": taskArr, "START": start, "END": end]
            ) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added")
                }
        }
        title = ""
        taskList = []
        id = 0
    }
}

struct ScheduleDayAddActivity_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleDayAddActivity(savedDay: "January 1, 2020")
    }
}
