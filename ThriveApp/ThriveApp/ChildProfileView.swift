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
        NavigationView {
        VStack {
            HStack(spacing: 50) {
                
                VStack {
                    
                    Image("blankimg").resizable()
                    .frame(width: 130.0, height: 130.0)
                    .clipShape(Circle())
                    NavigationLink(destination: ParentCommunicationPortal()) {
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
                    NavigationLink(destination: ScheduleView()) {
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
            Button(action: {signOut()}) {
                Text("Sign Out")
                .foregroundColor(.blue)
                .font(.title)
                .padding()
                .border(Color.blue, width: 5)
            }
            .navigationBarTitle(Text("Adam's Profile"), displayMode: .inline)
        }
    }
    }
}

struct ChildProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ChildProfileView()
    }
}
