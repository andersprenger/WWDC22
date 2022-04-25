//
//  IntroView.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct IntroView: View {
    let buttonHandler: () -> ()
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    TextComponent("Cryptography is a way to make communication safe in the presence of an adversary.")
                        .padding(.bottom)
                    
                    TextComponent("It allows the communication in the digital world to happen safely, without compromising passwords, conversations, or other sensitive data.")
                        .padding(.bottom)
                    
                    TextComponent("Cryptography is one of the foundations of privacy in our society, empowering communities in regions without liberty of expression, to communicate with each other without fear to be intercepted by governments or other organizations.")
                        .padding(.bottom)
                    
                    TextComponent("For that, we need the plaintext, a key and the cipher. The cipher is the process that will turn the plaintext into a ciphertext, using the key as a modifier of this process, this known as encryption.")
                        .padding(.bottom)
                    
                    TextComponent("Next, you will see the Caesar Cipher in action! It's one of the first encription algorithms in history.")
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

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView {
            print("pressed")
        }
    }
}
