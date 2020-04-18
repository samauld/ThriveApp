//
//  Post.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/30/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct Post: Identifiable {
    
    var id: String = UUID().uuidString
    
    let user: String?
    
    let image: String?
    
    let content: String?
    
    let time: String!
    
    let UTCdate: Date
    
    init(image: String?, content: String?, time: String, user: String, utcDate: Date) {
        self.user = user
        self.image = image
        self.content = content
        self.time = time
        self.UTCdate = utcDate
    }
}
