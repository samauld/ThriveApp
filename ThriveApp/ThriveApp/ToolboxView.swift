//
//  ToolboxView.swift
//  ThriveApp
//
//  Created by Sam Auld on 3/29/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct ToolboxView: View {
    @State private var heartRate: Double = 70
    
    //TODO: implement these functions
    func getTools(){
        //get the stored tools from firebase
    }
    
    func appendTool(){
        //add tool to firebase and update UI
    }
    
    var body: some View {
        NavigationView(){
            VStack{
                List{
                    //TODO: create ToolDetailView to populate the list
                    HStack {
                        Image("toolbox").resizable()
                        .frame(width: 50, height: 50)
                    NavigationLink(destination:ToolDetailView()){
                            Text("Blow Bubbles")
                        }.multilineTextAlignment(.leading)
                        //Have some sort of indication for what tool is active
                        Image("notification").resizable()
                        .frame(width: 50, height: 50)
                    }
                    HStack {
                        Image("toolbox").resizable()
                        .frame(width: 50, height: 50)
                        NavigationLink(destination:ToolDetailView()){
                            Text("Take Deep Breaths")
                        }.multilineTextAlignment(.leading)
                    }
                    HStack {
                        Image("toolbox").resizable()
                        .frame(width: 50, height: 50)
                        NavigationLink(destination:ToolDetailView()){
                            Text("Go for a walk")
                            .multilineTextAlignment(.leading)
                        }
                    }
                }
                HStack {
                    Text("Heartrate")
                    //Is this a good range??
                    Slider(value: $heartRate, in: 70...100, step:1.0)
                    Text("\(heartRate, specifier: "%.0f")")
                }.padding()
                Button(action:{}) {
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
