//
//  ColumnarTranspositionView.swift
//  Teste
//
//  Created by Anderson Sprenger on 22/04/22.
//

import SwiftUI

struct ColumnTranspositionView: View {
    @State private var cipherMode: Mode = .encript
    @State private var plainText: String = "Write the text to be criptographed here!"
    @State private var cipherText: String = ""
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
                        cipherText = columnTranspositionCipher(cipherMode, text: plainText)
                    }
                    .padding()
            }
            .cornerRadius(12)
            .padding(.horizontal)
            .frame(height: 200)
            
            Button {
                cipherText = columnTranspositionCipher(cipherMode, text: plainText)
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
            .navigationBarTitle("Columnar Transposition Cipher")
        }
    }
    
    func columnTranspositionCipher(_ mode: Mode, text: String) -> String {
        let columnSize = Int(sqrt(Double(text.count)).rounded(.up))
        var text = text
        for _ in text.count..<columnSize*columnSize {
            text.append(" ")
        }
        
        var textData: [String] = []
        for i in 0..<text.count {
            let strIndex = i % columnSize
            
            if strIndex >= textData.count {
                textData.append("")
            }
            
            textData[strIndex].append(text[text.index(text.startIndex, offsetBy: i)])
        }
        
        return textData.joined()
    }
}

struct ColumnTranspositionView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnTranspositionView()
    }
}
