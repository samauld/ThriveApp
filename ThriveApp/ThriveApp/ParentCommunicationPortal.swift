//
//  ParentCommunicationPortal.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/22/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore


struct ParentCommunicationPortal: View {
    
    @State private var post: String = ""
    @State private var posts = [Post]()
    @State private var user = Auth.auth().currentUser;
    let db = Firestore.firestore()
    
    func readPosts(){
//        db.collection("profiles").document(user?.uid ?? "").collection("portal").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                print(querySnapshot!.documents)
//                print("after query")
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        print (user?.uid)

//        db.collection("profiles").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        db.collection("profiles").document(user?.uid ?? "").getDocument()  { (document, error) in
            if let document = document {
                let group_array = document[self.user?.uid ?? ""] as? Array ?? [""]
                print(group_array)
            }

        }

        
    }
    
    func writePost(post: Post){
        readPosts()
//        db.collection("profiles").document(user?.uid ?? "" ).collection("portal").addDocument(data: [ "content": post.content, "date": post.time, "user": post.user]
//        ) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added")
//            }
//        }
    }
    
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
        
        writePost(post: p)
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

