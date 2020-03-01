//
//  ScheduleView.swift
//  ThriveApp
//
//  Created by Danny Kaminsky on 3/1/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""

    
    var body: some View {
        VStack{
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Monday 3/2")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Tuesday 3/3")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Wednesday 3/4")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Thursday 3/5")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Friday 3/6")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Saturday 3/7")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            Button(action: {signInAuthentication(email: self.username, password: self.password)}) {
                Text("Sunday 3/8")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
                                                                    }
        
    }
}



struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
