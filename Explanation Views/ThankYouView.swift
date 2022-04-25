//
//  ThankYouView.swift
//  Teste
//
//  Created by Anderson Sprenger on 24/04/22.
//

import SwiftUI

struct ThankYouView: View {
    private var cipherText: String = "pDdpG BqQ iqN ykASlpC pA wsr"
    
    @State private var plainText: String = ""
    @State private var cipherKey: String = ""
    @FocusState private var textIsFocused: Bool
    
    var body: some View {
        VStack {
            ZStack {
                Color.gray.opacity(0.16)
                Text(cipherText)
                    .padding()
            }
            .cornerRadius(12)
            .frame(height: 50)
            .padding()
            
            ZStack {
                Color.gray.opacity(0.16)
                TextField("Digit the key...", text: $cipherKey)
                    .padding()
            }
            .cornerRadius(12)
            .frame(height: 50)
            .padding()
            .focused($textIsFocused)
            .onChange(of: cipherKey) { _ in
                plainText = VigeniereView.vigeniereCipher(.decript, text: cipherText, key: cipherKey.lowercased())
            }
            
            ZStack {
                Color.gray.opacity(0.16)
                TextComponent(plainText)
                    .padding()
            }
            .cornerRadius(12)
            .frame(height: 50)
            .padding()
            
            if plainText == "Thank you for viewing my app" {
                Text("🔑🔓❤️")
                    .font(.system(size: 120))
            }
        }
        .padding()
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView()
    }
}
