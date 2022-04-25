//
//  VigeniereExplanationView.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct VigeniereExplanationView: View {
    let buttonHandler: () -> ()
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    TextComponent("To use the Vigenère cipher, first you need to repeat the key word until it has the same size of the plaintext. Then you get each letter of the plaintext, and also the letter in the same position but in the key repetition.")
                        .padding(.bottom)
                    
                    HStack {
                        Spacer()
                        
                        Image("TabulaRecta")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320)
                            .background(Color.white)
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    TextComponent("After that, you need to use the tabula recta, that is in the image above. Take the intersection of the line and column that starts with those letters, and you will have the letter of your ciphertext, just repeat for each letter of the plaintext to get the ciphertext.")
                        .padding(.bottom)
                    
                    TextComponent("To decript, just reverse the process.")
                        .padding(.bottom)
                    
                    TextComponent("It was introduced in 1553 by Giovan Batista Belaso (misattributed to Blaise de Vigenère), and was only broke in 1863, more than 3 centuries after its introduction.")
                        .padding(.bottom)
                    
                    TextComponent("Although the polyalphabetic ciphers are harder to be broken, it is not impossible, or even difficult to do with modern technology, unless it uses a One-time pad key.")
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
                        .padding(.bottom)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, deviceType == .phone ? 18 : 40)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}

struct VigeniereExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        VigeniereExplanationView {
            print("hello")
        }
    }
}
