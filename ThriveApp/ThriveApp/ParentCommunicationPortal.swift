//
//  ParentCommunicationPortal.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/22/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ParentCommunicationPortal: View {
    
    @State private var post: String = ""
    @State private var posts = [Post]()
    @State private var user = Auth.auth().currentUser;
    
    func appendPost(str: String){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        
        let p = Post(image: "mojave",
        content: str,
        time: "\(month)/\(day)/\(year) \(hour):\(minutes)")
        
        posts.append(p)
        post=""
    }
    
    var body: some View {
        NavigationView(){
            VStack(){
                Text("Recent Posts")
                    .fontWeight(.semibold)
                .padding(5)
                List {
                        // loop through all the posts and create a post view for each item
                        ForEach(posts) { post in
                           PostView(post: post)
                        }
                    }
                Spacer()
                TextField("Update here", text: $post)
                    .padding()
                    .border(Color.black, width: 1)
                    
                Button(action: {self.appendPost(str: self.post)}) {
                    Text("Post!")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.blue, width: 5)
                }
                .padding(.top)
            }
            .navigationBarTitle(Text("Communication Portal"), displayMode: .inline)
        }
    }
}

struct ParentCommunicationPortal_Previews: PreviewProvider {
    static var previews: some View {
        ParentCommunicationPortal()
    }
}

