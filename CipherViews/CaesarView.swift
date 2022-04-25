//
//  CaesarView.swift
//  Swift Student Challenge 22
//
//  Created by Anderson Sprenger on 20/04/22.
//

import SwiftUI

struct CaesarView: View {
    @State private var cipherMode: Mode = .encript
    @State private var plainText: String = "Write the text to be criptographed here"
    @State private var cipherText: String = ""
    @State private var cipherKey: Int = 0
    @FocusState private var textIsFocused: Bool
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ScrollView {
            Picker("Encript or Decript?", selection: $cipherMode) {
                Text("Encript").tag(Mode.encript)
                Text("Decript").tag(Mode.decript)
            }
            .pickerStyle(.segmented)
            .foregroundColor(.accentColor)
            .padding([.top, .horizontal])
            .onChange(of: cipherMode) { _ in
                if !plainText.isEmpty && !cipherText.isEmpty {
                    let aux = plainText
                    plainText = cipherText
                    cipherText = aux
                }
            }
            
            Title2Component(title: cipherMode == .encript ? "Plaintext" : "Ciphertext")
            
            ZStack {
                Color.gray.opacity(0.16)
                TextEditor(text: $plainText)
                    .focused($textIsFocused)
                    .onChange(of: plainText) { _ in
                        cipherText = caesarCipher(cipherMode, text: plainText, key: cipherKey)
                    }
                    .padding()
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .frame(height: 200)
            
            Title2Component(title: "Key")
            
            ZStack {
                Color.gray.opacity(0.16)
                Picker("Select the key to the cipher.", selection: $cipherKey) {
                    ForEach(-26...26, id: \.self) { i in
                        Text(String(i))
                    }
                }
                .pickerStyle(.wheel)
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .onChange(of: cipherKey) { _ in
                cipherText = caesarCipher(cipherMode, text: plainText, key: cipherKey)
                textIsFocused = false
            }
            
            Button {
                cipherText = caesarCipher(cipherMode, text: plainText, key: cipherKey)
                textIsFocused = false
            } label: {
                Text(cipherMode == .encript ? "Encript" : "Decript")
            }
            .buttonStyle(BorderedButtonStyle())
            .padding()
            
            Title2Component(title: cipherMode == .encript ? "Ciphertext" : "Plaintext")
            
            ZStack(alignment: .topLeading) {
                Color.gray.opacity(0.16)
                Text(cipherText)
                    .padding()
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .navigationBarTitle("Caesar Cipher")
        }
    }
    
    func caesarCipher(_ mode: Mode, text: String, key: Int) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        var textData = text.compactMap { char -> Int? in
            if char == " " {
                return -1
            }
            
            return alphabet.firstIndex(of: char)?.utf16Offset(in: alphabet)
        }
        
        switch mode {
        case .encript:
            for i in 0..<textData.count {
                let uText = textData[i]
                
                guard uText != -1 else {
                    continue
                }
                
                textData[i] = (uText + Int(key) + alphabet.count) % alphabet.count
            }
        case .decript:
            for i in 0..<textData.count {
                let uText = textData[i]
                
                guard uText != -1 else {
                    continue
                }
                
                textData[i] = ((uText - Int(key)) + alphabet.count) % alphabet.count
            }
        }
        
        let resultData = textData.map { charData in
            charData == -1 ? " " : alphabet[alphabet.index(alphabet.startIndex, offsetBy: charData)]
        }
        
        let result = String(resultData)
        return result
    }
}

struct CaesarView_Previews: PreviewProvider {
    static var previews: some View {
        CaesarView()
    }
}
