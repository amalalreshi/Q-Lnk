//
//  Word.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//


import Foundation
import SwiftUI
struct FadeInOutView: View {
    
    @State var characters: Array<String.Element>
    @State var opacity: Double = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double) {
        characters = Array(text)
        baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .font(.largeTitle)
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(num) * 0.09 ),
                               value: opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
                opacity = 1
            }
        }
        .onTapGesture {
            opacity = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                opacity = 1
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
