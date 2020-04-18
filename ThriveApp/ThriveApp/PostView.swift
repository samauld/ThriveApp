//
//  PostView.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 3/30/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct PostView: View {
    
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 10) {
                    
                    Image("commportal").resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        
                        Text(post.user ?? "Unknown").font(.headline)
                        Text(post.time).font(.subheadline)
                    }
                }
                
                Text(post.content ?? "").lineLimit(nil).font(.body)
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            
            
        }
        .padding(.top, 5)
    }
}

