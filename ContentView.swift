//
//  ContentView.swift
//  Teste
//
//  Created by Anderson Sprenger on 21/04/22.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case intro, caesarCipher, caesarExplanation, probabilityExplanation, vigeniereCipher,
             vigeniereExplanation, permutationCipher, otpExplanation, permutationExplanation,
             thankYou
        
        func hideNavigationBar() -> Bool {
            switch self {
            case .caesarCipher:
                return false
            case .vigeniereCipher:
                return false
            case .permutationCipher:
                return false
            default:
                return true
            }
        }
    }
    
    @State var tabSelection: Tab = .intro
    
    let deviceType = UIDevice.current.userInterfaceIdiom
    
    init() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor(.accentColor).withAlphaComponent(0.4)
        pageControl.currentPageIndicatorTintColor = UIColor(.accentColor)
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            intro
                .tag(Tab.intro)
            
            caesarCipher
                .tag(Tab.caesarCipher)
            
            caesarExplanation
                .tag(Tab.caesarExplanation)
            
            probabilityExplanation
                .tag(Tab.probabilityExplanation)
            
            vigeniereCipher
                .tag(Tab.vigeniereCipher)
            
            vigeniereExplanation
                .tag(Tab.vigeniereExplanation)
            
            otpExplanation
                .tag(Tab.otpExplanation)
            
            permutationCipher
                .tag(Tab.permutationCipher)

            permutationExplanation
                .tag(Tab.permutationExplanation)
            
            thankYou
                .tag(Tab.thankYou)
        }
        .tabViewStyle(.page)
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
        .navigationBarBackButtonHidden(true)
    }
    
    var intro: some View {
        IntroView {
            withAnimation {
                tabSelection = .caesarCipher
            }
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var caesarCipher: some View {
        VStack {
            CaesarView()
            
            Button {
                withAnimation {
                    tabSelection = .caesarExplanation
                }
            } label: {
                Text("Next")
            }
            .buttonStyle(CoolButtonStyle())
            .padding()
            .padding(.bottom, deviceType == .phone ? 8 : 34)
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var caesarExplanation: some View {
        CaesarExplanationView {
            withAnimation {
                tabSelection = .probabilityExplanation
            }
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var probabilityExplanation: some View {
        ProbabilityExplanationView {
            withAnimation {
                tabSelection = .vigeniereCipher
            }
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var vigeniereCipher: some View {
        VStack {
            VigeniereView()
            
            Button {
                withAnimation {
                    tabSelection = .vigeniereExplanation
                }
            } label: {
                Text("Next")
            }
            .buttonStyle(CoolButtonStyle())
            .padding()
            .padding(.bottom, deviceType == .phone ? 8 : 34)
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var vigeniereExplanation: some View {
        VigeniereExplanationView {
            withAnimation {
                tabSelection = .otpExplanation
            }
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var otpExplanation: some View {
        OTPExplanation{
            withAnimation {
                tabSelection = .permutationCipher
            }
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }

    var permutationCipher: some View {
        VStack {
            ColumnTranspositionView()
            
            Button {
                withAnimation {
                    tabSelection = .permutationExplanation
                }
            } label: {
                Text("Next")
            }
            .buttonStyle(CoolButtonStyle())
            .padding()
            .padding(.bottom, deviceType == .phone ? 8 : 34)
            .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
        }
    }
    
    var permutationExplanation: some View {
        PermutationExplanationView {
            withAnimation {
                tabSelection = .thankYou
            }
        }
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
    
    var thankYou: some View {
        ThankYouView()
        .navigationBarHidden($tabSelection.wrappedValue.hideNavigationBar())
    }
}

struct ExpanationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
