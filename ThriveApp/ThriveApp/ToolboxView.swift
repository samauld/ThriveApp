//
//  ToolboxView.swift
//  ThriveApp
//
//  Created by Amy Auld on 3/29/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct ToolboxView: View {
    
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
                    Text("tool1")
                    Text("tool2")
                    Text("tool3")
                }
                Button(action:{}) {
                   Text("+ Add Regulation Tool")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.blue, width: 5)
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
