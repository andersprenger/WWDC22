//
//  CaesarExplanationView.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct CaesarExplanationView: View {
    let buttonHandler: () -> ()
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    TextComponent("The Caesar Cipher is a substitution cipher, that changes a letter for another, in this case: the number of the key, times ahead in the alphabet.")
                        .padding(.bottom)
                    
                    HStack {
                        Spacer()
                        
                        Image("CaesarCipher")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    TextComponent("It was the first cipher to have its use documented in history, by Julius Caesar who ruled from 49 BC to 44 BC.")
                        .padding(.bottom)
                    
                    TextComponent("This is also a monoalphabetic cipher, which means that the encryption of the plaintext is done using the same part of the key for all its letters.")
                        .padding(.bottom)
                    
                    TextComponent("Monoalphabetic cipher is a kind of cipher that isn’t much safe, because each letter is always swapped by the same, which opens a security breach to decript the message without the key, using probability.")
                        .padding(.bottom)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            buttonHandler()
                        } label: {
                            Text("Next")
                        }
                        .buttonStyle(CoolButtonStyle())
                        .padding()
                        .padding(.bottom, deviceType == .phone ? 8 : 34)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, deviceType == .phone ? 18 : 40)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}

struct CaesarExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        CaesarExplanationView {
            print("button pressed")
        }
    }
}
