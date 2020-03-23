//
//  ParentCommunicationPortal.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/22/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct ParentCommunicationPortal: View {
    
    @State private var post: String = ""
    @State private var posts = [String]()
    
    func appendPost(str: String){
        posts.append(str)
        post=""
    }
    
    func getPosts() -> String{
        if posts.count == 0{
            return "No posts"
        }
        else {
            return posts[posts.count-1]
        }
    }
    
    var body: some View {
        NavigationView(){
            VStack(){
                Text("Recent Posts")
                    .fontWeight(.semibold)
                .padding(5)
                Text(getPosts())
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

