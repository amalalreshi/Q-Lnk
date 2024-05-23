//
//  GIF.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//

import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
    let gifName: String
    let duration: TimeInterval
    let opacity: CGFloat
    @Binding var isVisible: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.alpha = opacity
        webView.scrollView.isScrollEnabled = false
        webView.contentMode = .scaleAspectFit
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if isVisible {
            if let filePath = Bundle.main.path(forResource: gifName, ofType: "gif") {
                let url = URL(fileURLWithPath: filePath)
                let request = URLRequest(url: url)
                uiView.load(request)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        self.isVisible = false
                    }
                }
            }
        } else {
            uiView.load(URLRequest(url: URL(string: "about:blank")!))
        }
    }
}

struct SwiftUIView: View {
    @State private var isGIFVisible = true
    @State private var navigateToNextView = false
    
    private let backgroundColor = Color(UIColor(red: 24/255, green: 184/255, blue: 219/255, alpha: 1.0))
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                if isGIFVisible {
                    GIFView(gifName: "gif", duration: 6, opacity: 1, isVisible: $isGIFVisible)
                        .position(x: 200, y: 500)
                }
                
                FadeInOutView(text: "Q-Lnk", startTime: 0.5)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 250)
                
                NavigationLink(
                    destination: AppInterface()
                    .navigationBarBackButtonHidden(true)
                    ,isActive: $navigateToNextView,
                    label: { EmptyView() }
                    
                )
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.navigateToNextView = true
                }
            }
        }
    }
}


#Preview {
    SwiftUIView()
}



