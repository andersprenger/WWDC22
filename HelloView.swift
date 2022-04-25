//
//  HelloView.swift
//  Teste
//
//  Created by Anderson Sprenger on 20/04/22.
//

import SwiftUI

struct HelloView: View {
    enum Page {
        case hello, callToAction
    }
    
    @State var selectedPage: Page = .hello
    
    init() {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor(.accentColor).withAlphaComponent(0.4)
        pageControl.currentPageIndicatorTintColor = UIColor(.accentColor)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selectedPage) {
                    hello
                        .tag(Page.hello)
                    
                    callToAction
                        .tag(Page.callToAction)
                }
                .tabViewStyle(.page)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var hello: some View {
        VStack {
            VStack(alignment: .leading) {
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Text("Hello! 😃")
                        .font(.system(size: 48, weight: .semibold))
                        .padding(.bottom, 20)
                    
                    Text("My name is Anderson,\nand this is my \n\(Image(systemName: "applelogo"))WWDC22 Swift Student Challenge Submission!")
                        .fontWeight(.semibold)
                }
                
                else {
                    Text("Hello! 😃")
                        .font(.system(size: 68, weight: .semibold))
                        .padding(.bottom, 20)
                    
                    Text("My name is Anderson, and this is my \n\(Image(systemName: "applelogo"))WWDC22 Swift Student Challenge Submission!")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .padding(24)
            
            Button {
                withAnimation {
                    selectedPage = .callToAction
                }
            } label: {
                Text("Next")
            }
            .buttonStyle(CoolButtonStyle())
        }
    }
    
    var callToAction: some View {
        VStack {
            VStack(alignment: .leading) {
                if UIDevice.current.userInterfaceIdiom == .phone {
                    Text("Today, I will talk about criptography, it's history and how it works!")
                        .fontWeight(.semibold)
                }
                
                else {
                    Text("Today, I will talk about criptography, \nit's history, importance in our life, and how it works!")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .padding(24)
            
            NavigationLink {
                ContentView()
            } label: {
                Text("Let's dive right in!")
            }
            .buttonStyle(CoolButtonStyle())
            .foregroundColor(.accentColor)
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        //        HelloView()
        //            .previewDevice("iPhone 12")
        
        //        HelloView()
        //            .previewDevice("iPad Pro (11-inch) (3rd generation)")
        
        HelloView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        
        //        HelloView()
        //            .previewDevice("iPad Pro (9.7-inch)")
    }
}
