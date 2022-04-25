//
//  ProbabilityView.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct ProbabilityExplanationView: View {
    let buttonHandler: () -> ()
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    TextComponent("In the English language, \"E\" has a higher probability to be the letter that appear the most in a phase. Then, is much likely that the letter that appears the most in ciphertext from a monoalphabetic cipher is \"E\".")
                        .padding(.bottom)
                    
                    TextComponent("For curiosity, in the image below there's a graphic showing the frequency of the letters in a tipical sample text in English.")
                        .padding(.bottom)
                    
                    HStack {
                        Spacer()
                        
                        Image("ProbabilityLetter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320)
                            .background(Color.white)
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    TextComponent("This opens a way to search for a word with 3 letters finishing with \"E\", that much probably will be \"the\", and repeating the process, seaching for the most popular letters, you will figure out all the message, almost like a hangman game.")
                        .padding(.bottom)
                    
                    TextComponent("To mitigate this, we can use polyalphabetic ciphers, whose key has many letters, increasing the possibilities from just one substitution to many for each letter.")
                        .padding(.bottom)
                    
                    TextComponent("Next, you will see the Vigenère cipher, a great example of polyalphabetic cipher.")
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

struct ProbabilityView_Previews: PreviewProvider {
    static var previews: some View {
        ProbabilityExplanationView {
            print("button pressed")
        }
    }
}
