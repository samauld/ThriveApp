//
//  Post.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/30/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI
import FirebaseAuth

/// Post
struct Post: Identifiable {
    
    /// unique id
    var id: String = UUID().uuidString
    
    /// user
    let user: String?
    
    /// post image
    let image: String?
    
    /// post content
    let content: String?
    
    /// post time
    let time: String!
    
    let UTCdate: Date
    
    
    /// Init
    init(image: String?, content: String?, time: String, user: String, utcDate: Date) {
        self.user = user
        self.image = image
        self.content = content
        self.time = time
        self.UTCdate = utcDate
    }
}
