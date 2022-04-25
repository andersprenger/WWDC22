//
//  Title2Component.swift
//  Swift Student Challenge 22
//
//  Created by Anderson Sprenger on 20/04/22.
//

import SwiftUI

struct Title2Component: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding([.top, .leading])
            
            Spacer()
        }
    }
}
