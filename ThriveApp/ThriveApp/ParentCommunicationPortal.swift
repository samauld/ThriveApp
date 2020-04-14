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
        let docRef = db.collection("profiles").document(user?.uid ?? "");

        docRef.getDocument { (document, error) in
        if let document = document {
            //if document.exists{
                docRef.collection("portal").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        self.posts.insert(Post(image: "mojave",
                                          content: document.data()["content"] as! String,
                        time: document.data()["date"] as! String,
                        user: document.data()["user"] as! String, utcDate: (document.data()["utcDate"] as! Timestamp).dateValue()), at:0)
                    }
                }
                }
            }
            else {
                print("Document does not exist")
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.posts = self.posts.sorted { $0.UTCdate > $1.UTCdate }
        }
        }
    

    func writePost(post: Post){
        db.collection("profiles").document(user?.uid ?? "" ).collection("portal").addDocument(data: [ "content": post.content, "date": post.time, "user": post.user, "utcDate": post.UTCdate]
        ) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    
    func appendPost(str: String){
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let string = dateFormatter.string(from: date as Date)
        print(string)
        
        let p = Post(image: "mojave",
        content: str,
        time: "\(month)/\(day)/\(year) \(string)",
            user: (Auth.auth().currentUser?.email)!,
            utcDate: date)
        
        writePost(post: p)
        posts.insert(p, at:0)
        post=""
    }

    var body: some View {
        VStack(){
                Text("Recent Posts")
                    .fontWeight(.semibold)
                .padding(5)
                List {
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
            .onAppear(perform: readPosts)
            .navigationBarTitle(Text("Communication Portal"), displayMode: .inline)
    }
}

struct ParentCommunicationPortal_Previews: PreviewProvider {
    static var previews: some View {
        ParentCommunicationPortal()
    }
}

