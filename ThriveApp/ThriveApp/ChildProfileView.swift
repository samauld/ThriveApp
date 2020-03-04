//
//  SwiftUIView.swift
//  ThriveApp
//
//  Created by Emily Heckel on 3/1/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct ChildProfileView: View {
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("<")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding(8)
                }
                Text("Adam's Profile")
                    .font(Font.system(size: 30, design: .default))
            }
            Divider()
            HStack(spacing: 50) {
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    Button(action: {}) {
                        Text("Messages")
                    }
                }
                
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    Button(action: {}) {
                        Text("Notifications")
                    }
                }
            }
            .padding(.top)
            HStack(spacing: 50) {
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    Button(action: {}) {
                        Text("Schedule")
                    }
                }
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    Button(action: {}) {
                        Text("Regulation Toolbox")
                    }
                }
            }
            .padding(.top)
            HStack(spacing: 50) {
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    Button(action: {}) {
                        Text("Reward Bank")
                    }
                }
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    Button(action: {}) {
                        Text("Geofences")
                    }
                }
            }
            .padding(.top)
            Spacer()

            
        }
    }
}

struct ChildProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ChildProfileView()
    }
}
