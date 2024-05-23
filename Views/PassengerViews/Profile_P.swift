//
//  Profile_P.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//


import SwiftUI
import PhotosUI
import CloudKit




struct Profile_P: View {
  
    @State private var rating: Double?
    @State var avatarImage: Image = Image(.defaultAvatar)
    @State var selectedImage: PhotosPickerItem? = nil
    var body: some View {
        
        
     
            
        NavigationStack {
        
            ZStack{
                
                Color.icon.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 400 , height: 230)
               
                
                Image("mask")
                 
               
                VStack{
                    
                    
                    HStack{
                        
                       PhotosPicker(selection: $selectedImage, matching: .images) {
                            Image("defaultAvatar")
                                .resizable()
                                .scaledToFill() // <=== Saves aspect ratio
                                .frame(width: 60, height:60)
                                .foregroundColor(.white) }
                        
                        .padding()
                        
                        
                        VStack{
                            
                            Text("سارة")
                                .padding(.trailing,80)
                            
                            
                             RatingView(rating: $rating)
                               
                        }
                    }
                } .padding(.trailing,170)
                    
                
                VStack{
                    
                    HStack{
                        
                        Image(systemName: "rectangle.and.paperclip")
                            .font(.system(size: 20))
                            .padding()
                        Text("طلباتي")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(.trailing,180)
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                        
                    }
                    
                    HStack{
                        
                        Image(systemName: "ellipsis.bubble")
                            .font(.system(size: 20))
                            .padding()
                        Text("تقيمات السائقين")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(.trailing,110)
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                        
                    }
                } .padding(.top,500)
                  .padding(.trailing,40)
                
                    
                    
                    
                    
                    
                    
                
            
                .navigationTitle("الملف الشخصي")
                
                .toolbar {
                    Image(systemName: "pencil")
                }
    
                .navigationBarTitleDisplayMode(.inline)
            } .padding(.bottom,490)
        }
        
        
        
        
        
    }
}

#Preview {
    Profile_P()
}




struct RatingView: View {
    
    @Binding var rating: Double?
    let imageSize: Double = 40
    
    private func handleTap(at index: Double, location: CGPoint) {
        let isTappedOnLeftSide = location.x < imageSize/2
        rating = isTappedOnLeftSide ? index - 0.5: index
    }
    
    private func starType(_ index: Int) -> String {
        
        guard let rating = rating else { return "star" }
        
        let roundedRating = Int(ceil(rating))
        
        if index <= roundedRating {
            if index <= Int(rating) {
                return "star.fill"
            } else {
                return "star.leadinghalf.fill"
            }
        }
        
        return "star"
        
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                
                let doubleIndex = Double(index)
                
                Image(systemName: starType(index))
                    .resizable()
                    .frame(width: 15,height: 15)
                    .foregroundStyle(.yellow)
                    .font(.largeTitle)
                    .onTapGesture(coordinateSpace: .local) {
                        handleTap(at: doubleIndex, location: $0)
                    }
            }
        }
    }
    
}
