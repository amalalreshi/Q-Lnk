//
//  MainPage.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//


import SwiftUI

struct MainPage: View {
 
    
    var body: some View {
      
        
        TabView {
            
            OffersView()
                     .tabItem {
                         Label("العروض", systemImage: "car")
                     }

            Profile_P()
                     .tabItem {
                         Label("الملف الشخصي", systemImage: "person")
                     }
             }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    MainPage()
}
