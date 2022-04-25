//
//  PermutationView.swift
//  Teste
//
//  Created by Anderson Sprenger on 23/04/22.
//

import SwiftUI

struct PermutationExplanationView: View {
    let buttonHandler: () -> ()
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    TextComponent("To create the columnar transposition cipher, first you need to get the square root of the number of letters in your plaintext and round it up.")
                        .padding(.bottom)
                    
                    TextComponent("Then you create a table, divide the plaintext in the square root number of parts and put each part into a row, splitting the row to have each letter into a column of the table.")
                        .padding(.bottom)
                    
                    TextComponent("If the number of letters in one of the rows is less than the root, put spaces until this part has the same number.")
                        .padding(.bottom)
                    
                    TextComponent("After that, recreate the text but joining by column rather than by row, and it's done! To decript is just repeat the process.")
                        .padding(.bottom)
                    
                    TextComponent("Modern cryptography algorithms, like AES, use permutation ciphers together with substitution ciphers, which is called a SP Network.")
                        .padding(.bottom)
                    
                    TextComponent("The idea is that the adversary fail to decrypt the ciphertext in a timely manner, only being theoretically possible in a trillion years with supercomputers.")
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

struct PermutationExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        PermutationExplanationView {
            print(#function)
        }
    }
}
