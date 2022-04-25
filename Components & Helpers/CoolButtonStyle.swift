//
//  CoolButtonStyle.swift
//  Teste
//
//  Created by Anderson Sprenger on 20/04/22.
//

import SwiftUI

struct CoolButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(Font.body.weight(.semibold))
                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 7)
        .background(Color.accentColor)
        .cornerRadius(8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
