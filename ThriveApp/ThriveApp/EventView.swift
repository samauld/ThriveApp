//
//  EventView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/30/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct EventView: View {
   
    /// post
    let event: Event
    @State var detailView: Bool = false
    
    /// body
    var body: some View {
        VStack() {
           
                NavigationLink(destination: TaskListView(event: event)) {
                    Text(event.title ?? "")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        .frame(width: 300, height: 60)
                }
            
            
        }
    }
}

