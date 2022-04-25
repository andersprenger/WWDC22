//
//  ModernCriptographyView.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct OTPExplanation: View {
    let buttonHandler: () -> ()
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    TextComponent("For a key to be One-time pad, it needs to be used just once, and besides that, it needs to be at least of the size of the plaintext and be aleatory enough, without a pattern or repetition.")
                        .padding(.bottom)
                    
                    TextComponent("If you use a One-time pad in a cipher, there’s no way to find a pattern in the ciphertext, making it impossible to be broke.")
                        .padding(.bottom)
                    
                    TextComponent("Substitution algorithms, like these we had seem, are used in modern cryptography together with permutation techniques.")
                        .padding(.bottom)
                    
                    TextComponent("To show you how it works, you will see next a permutation cipher!")
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

struct ModernCriptographyView_Previews: PreviewProvider {
    static var previews: some View {
        OTPExplanation {
            print("button pressed")
        }
    }
}
