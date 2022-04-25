//
//  VigeniereView.swift
//  Teste
//
//  Created by Anderson Sprenger on 20/04/22.
//

import SwiftUI

struct VigeniereView: View {
    enum Field {
        case text, key
    }
    
    @State private var cipherMode: Mode = .encript
    @State private var plainText: String = "Write the text to be criptographed here"
    @State private var cipherText: String = ""
    @State private var cipherKey: String = "Write the cipher key here"
    @FocusState private var textIsFocused: Field?
    
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
                    .focused($textIsFocused, equals: .text)
                    .onChange(of: plainText) { _ in
                        cipherText = VigeniereView.vigeniereCipher(cipherMode, text: plainText, key: cipherKey)
                    }
                    .padding()
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .frame(height: 200)
            
            Title2Component(title: "Key")
            
            ZStack {
                Color.gray.opacity(0.16)
                TextField("Digit the key...", text: $cipherKey)
                    .padding()
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .focused($textIsFocused, equals: .key)
            .onChange(of: cipherKey) { _ in
                cipherText = VigeniereView.vigeniereCipher(cipherMode, text: plainText, key: cipherKey)
            }
            
            Button {
                cipherText = VigeniereView.vigeniereCipher(cipherMode, text: plainText, key: cipherKey)
                textIsFocused = nil
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
            .navigationBarTitle("Vigenère Cipher")
        }
    }
    
    static func vigeniereCipher(_ mode: Mode, text: String, key: String) -> String {
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        
        var textData = text.compactMap { char -> Int? in
            if char == " " {
                return -1
            }
            
            return alphabet.firstIndex(of: char)?.utf16Offset(in: alphabet)
        }
        
        let keyData = key.compactMap { char -> Int?  in
            if char == " " {
                return -1
            }
            
            return alphabet.firstIndex(of: char)?.utf16Offset(in: alphabet)
        }
        
        guard !keyData.isEmpty else {
            return ""
        }
        
        switch mode {
        case .encript:
            for i in 0..<textData.count {
                let uText = textData[i]
                let uKey = keyData[i % keyData.count]
                
                guard uText != -1 && uKey != -1 else {
                    continue
                }
                
                textData[i] = (uText + uKey) % alphabet.count
            }
        case .decript:
            for i in 0..<textData.count {
                let uText = textData[i]
                let uKey = keyData[i % keyData.count]
                
                guard uText != -1 && uKey != -1 else {
                    continue
                }
                
                textData[i] = ((uText - uKey) + alphabet.count) % alphabet.count
            }
        }
        
        let result = String(textData.map { $0 == -1 ? " " :  alphabet[alphabet.index(alphabet.startIndex, offsetBy: $0)] })
        return result
    }
}


struct VigeniereView_Previews: PreviewProvider {
    static var previews: some View {
        VigeniereView()
            .previewDevice("iPhone 12")
    }
}
