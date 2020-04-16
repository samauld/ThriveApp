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
    
    /// body
    var body: some View {
        VStack() {
            Button(action: {}) {
                Text(event.title ?? "")
                    .foregroundColor(.blue)
                    .font(.title)
                .multilineTextAlignment(.leading)
                    .padding()
                    .frame(width: 300, height: 60)
            }
            Divider()
        }
    }
}

