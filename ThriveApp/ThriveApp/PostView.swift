//
//  PostView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/30/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

import SwiftUI

/// PostView
struct PostView: View {
   
    /// post
    let post: Post
    
    /// body
    var body: some View {
        
        /// main vertical stack view - contains upper stackview and image
        VStack(alignment: .leading, spacing: 10) {
            
            // Upper Stackview - Contains Horizontal stack and post content
            VStack(alignment: .leading) {
                
                HStack(spacing: 10) {
                    
//                    // avatar
//                    AvatarView(image: post.user.avatar, size: 70)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        
                        // name
                        Text(post.user ?? "Unknown").font(.headline)
                        // post time
                        Text(post.time).font(.subheadline)
                    }
                }
                
                // post content - specify nil for multi-line text
                Text(post.content ?? "").lineLimit(nil).font(.body)
            }
            .padding(.leading, 15)  // spacing from left edge of the view
            .padding(.trailing, 15) // spacing from right edge of the view
            
            // post image
//            Image(post.image ?? "")
//                .resizable()  // creates resizable image
//                 // this will allow image to fit the screen width maintaining aspect ratio
//                .aspectRatio(3/2, contentMode: .fit)
        }
        .padding(.top, 5)
    }
}

