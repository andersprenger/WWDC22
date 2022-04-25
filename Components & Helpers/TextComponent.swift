//
//  TextComponent.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct TextComponent: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            Text(text)
                .fontWeight(.semibold)
        }
        
        else {
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
        }
    }
}
