//
//  ScheduleDayView.swift
//  ThriveApp
//
//  Created by Danny Kaminsky on 3/1/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//
import SwiftUI

struct ScheduleDayView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @Binding var varFromParent : String
    
    var body: some View {
        VStack{
            Text("\(varFromParent)")
                .font(.title)
                .padding()
            Divider()
            //Spacer()
            VStack {
                Button(action: {
                    signInAuthentication(email: self.username, password: self.password)
                }) {
                    Text("Event 1")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        //.border(Color.blue, width: 5)
                        .frame(width: 300, height: 60)
                }
                Divider()
                Button(action: {
                    signInAuthentication(email: self.username, password: self.password)
                }) {
                    Text("Event 2")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        //.border(Color.blue, width: 5)
                        .frame(width: 300, height: 60)
                }
                Divider()
                Button(action: {
                    signInAuthentication(email: self.username, password: self.password)
                }) {
                    Text("Event 3")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        //.border(Color.blue, width: 5)
                        .frame(width: 300, height: 60)
                }
                Divider()
                Button(action: {
                    signInAuthentication(email: self.username, password: self.password)
                }) {
                    Text("Event 4")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        //.border(Color.blue, width: 5)
                        .frame(width: 300, height: 60)
                }
                Divider()
                Button(action: {
                    signInAuthentication(email: self.username, password: self.password)
                }) {
                    Text("Event 5")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        //.border(Color.blue, width: 5)
                        .frame(width: 300, height: 60)
                }
            }
            //TODO: Make the above VStack scrollable...maybe through a List?
            Divider()
            Spacer() //I think this is how to keep the button at the bottom
            Divider()
            Button(action: {
                let key: String = "Add activity button pressed"
                print(key)
            }) {
                Text("+ Add Activity")
                .foregroundColor(.blue)
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding()
                //.border(Color.blue, width: 5)
                .frame(width: 300, height: 60)
            }
        }
    }
}

struct ScheduleDayView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleDayView(varFromParent: .constant("TestTest"))
    }
}
