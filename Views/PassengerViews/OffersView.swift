//
//  Offers.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//


import SwiftUI

struct OffersView: View {
  
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                Color(.background).ignoresSafeArea()
                
                VStack{
                    Text("لاتوجد عروض حالية")
                        .foregroundStyle(.gray)
                        .padding()
                    
                    Image(systemName: "plus")
                        .font(.system(size: 25))
                        .foregroundColor(.icon)
                }
                .navigationTitle("العروض")
                .navigationBarTitleDisplayMode(.inline)
            }}}
}

#Preview {
    OffersView()
}
