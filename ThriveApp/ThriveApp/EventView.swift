//
//  EventView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/30/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct EventView: View {
   
    let event: Event
    @State var detailView: Bool = false
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "hh:mm a"
        print(formatter.string(from: date))
        return date == nil ? "" : formatter.string(from: date)
    }

    
    /// body
    var body: some View {
        VStack() {
           
                NavigationLink(destination: TaskListView(event: event)) {
                    Text("\(getTextFromDate(date:event.start)) ").font(.subheadline)
                    Text("-").font(.subheadline)
                    Text(" \(getTextFromDate(date:event.end))").font(.subheadline)
                    
                    Text(event.title ?? "")
                        .foregroundColor(.blue)
                        .font(.title)
                    .multilineTextAlignment(.leading)
                        .padding()
                        .frame(width: 225, height: 60)
                }
            
            
        }
    }
}
struct EventViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event(tasks: ["Brush Teeth"], title: "Brush teeth", id:"", date: "July 1, 2020", start: Date(), end: Date()))
    }
}

