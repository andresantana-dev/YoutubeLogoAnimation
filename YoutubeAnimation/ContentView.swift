//
//  ContentView.swift
//  YoutubeAnimation
//
//  Created by André Santana on 29/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var isClicked: Bool = false
    @State var imageIsReady: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            Image("youtube")
                .resizable()
                .frame(width: 80, height: 80)
                .offset(x: isClicked ? -60 : 0)
            
            Text("Youtube")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .opacity(imageIsReady ? 1.0 : 0.0)
                .offset(x: imageIsReady ? 45 : 20)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isClicked.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation {
                            imageIsReady.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
