//
//  RewardBankView.swift
//  ThriveApp
//
//  Created by Emily Heckel on 3/21/20.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//

import SwiftUI

struct RewardBankView: View {
    @State var count: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Tokens: \(count)")
                .font(.title)
            HStack {
                Button(action: {
                    self.count += 1
                }) {
                    Text("Add token")
                }
                Button(action: {
                    if (self.count > 0) {
                        self.count -= 1
                    }
                }) {
                    Text("Take away token")
                }
            }
        }
    }
}

struct RewardBankView_Previews: PreviewProvider {
    static var previews: some View {
        RewardBankView()
    }
}
