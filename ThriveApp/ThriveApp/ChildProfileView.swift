//
//  SwiftUIView.swift
//  ThriveApp
//
//  Created by Emily Heckel on 3/1/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("<")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding(8)
                    .border(Color.blue, width: 4)
                }
                Text("Adam's Profile")
                .font(Font.system(size: 30, design: .default))
            }
            
            HStack {
                Button(action: {}) {
                    Text("Hello")
                }
                Image("blankimg").resizable()
                .frame(width: 130.0, height: 130.0)
                .clipShape(Circle())
            }
            
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
