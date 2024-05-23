//
//  RegisteringPost-P.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//

import SwiftUI

struct RegisteringPost_P: View {
        
        @State private var selection = 0
        @State var first_Destination: String? = nil
        @State var trip_Type: String? = nil
        @State var time_Arrive = "  "
        @State var num_People = "  "
        @State var second_Destination: String? = nil
        @State var work_Type :String? = nil
        @State var days_Work = ""
        @State var time_End = ""
        @State var contract_Type : String? = nil
        @State var contract_Start = "" // date mybe change logic
        @State var contract_End = ""
        @State var tittle = ""
        @State var notes = ""
    
        @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
        var body: some View {
            
            NavigationStack{
               
                ZStack{
                    
                    Color(.background).ignoresSafeArea()
                    
                    
                    TabView(selection: $selection) {
                        
                        
                        VStack{
                            
                            
                            VStack{
                                
                                
                                
                                Text("الرجاء تعبئة نموذج الطلب حتى تتمكن من تلقي عروض التوصيل ")
                                    .bold()
                                    .font(Font.system(size: 13))
                                
                                
                                
                            } .padding(.bottom,100)
                            
                            Text("الوجهة الأولى:*")
                                .padding(.trailing,250)
                            DropDownPicker(
                                selection: $first_Destination,
                                options: [
                                    "الرمال",
                                    "المونسية",
                                    "الازدهار",
                                    "الملز",
                                    "المنار"
                                ]
                            ).padding(.trailing,150)
                            
                            Text("نوع الرحلة:*")
                                .padding(.trailing,250)
                            DropDownPicker(
                                selection: $trip_Type,
                                options: [ "ذهاب","اياب","ذهاب واياب" ]
                            ).padding(.trailing,150)
                            
                            
                            Text("وقت حضور السائق:*")
                                .padding(.trailing,220)
                            TextField("", text: $time_Arrive)
                                .frame(width: 333 , height: 44)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                            
                            
                            Text("عدد الأشخاص:*")
                                .padding(.trailing,250)
                            TextField("", text: $num_People)
                                .frame(width: 333 , height: 44)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                            
                            
                            
                            
                            //
                            //                .disabled(((FirstDestination?.isEmpty) != nil) && (TripType != nil) && Time.isEmpty && PNum.isEmpty)
                            
                            
                            
                            
                            Button("التالي") {
                                
                                withAnimation{
                                    
                                    selection = 1
                                    
                                }
                            } .frame(width: 350 , height: 50)
                                .foregroundColor(Color.white)
                                .background(.icon)
                                .cornerRadius(12)
                                .font(.system(size: 20 ))
                                .foregroundColor(.white)
                                .padding(.top,50)
                            
                            
                            
                            
                            
                            
                            
                        }.tag(0)
                            .padding(.bottom,80)
                        
                        
                        VStack{
                            
                          
                            
                            VStack{
                                
                                Text("الوجهة الثانية:*")
                                    .padding(.trailing,250)
                                DropDownPicker(
                                    selection: $second_Destination,
                                    options: [
                                        "الرمال",
                                        "المونسية",
                                        "الازدهار",
                                        "الملز",
                                        "المنار"
                                    ]
                                ).padding(.trailing,150)
                                
                                Text("طبيعة العمل:")
                                    .padding(.trailing,250)
                                DropDownPicker(
                                    selection: $work_Type,
                                    options: [ "شفتات","دوام كامل" ]
                                ).padding(.trailing,150)
                                
                                
                                Text("عدد أيام الدوام:")
                                    .padding(.trailing,220)
                                TextField("", text: $days_Work)
                                    .frame(width: 333 , height: 44)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .font(.headline)
                                
                                
                                Text("وقت نهاية الدوام:*")
                                    .padding(.trailing,250)
                                TextField("", text: $time_End)
                                    .frame(width: 333 , height: 44)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .font(.headline)
                                
                                
                                
                                Button("التالي") {
                                    
                                    withAnimation{
                                        
                                        selection = 2
                                        
                                    }
                                } .frame(width: 350 , height: 50)
                                    .foregroundColor(Color.white)
                                    .background(.icon)
                                    .cornerRadius(12)
                                    .font(.system(size: 20 ))
                                    .foregroundColor(.white)
                                    .padding(.top,50)
                                
                                
                                
                                
                            } .padding(.bottom,50)
                            
                            
                        }.tag(1)
                        
                        
                        VStack{
                            
                            
                            
                            
                            
                            Text("نوع العقد:*")
                                .padding(.trailing,250)
                            DropDownPicker(
                                selection: $contract_Type,
                                options: [
                                   "اسبوعي",
                                    "شهري"
                                ]
                            ).padding(.trailing,150)
                            
                           
                            Text("تاريخ بداية العقد:*")
                                .padding(.trailing,220)
                            TextField("", text: $contract_Start)
                                .frame(width: 333 , height: 44)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                            
                            
                            Text("تاريخ نهاية العقد:*")
                                .padding(.trailing,250)
                            TextField("", text: $contract_End)
                                .frame(width: 333 , height: 44)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                            
                            
                            
                            
                            Button("التالي") {
                                
                                withAnimation{
                                    
                                    selection = 3
                                    
                                }
                            } .frame(width: 350 , height: 50)
                                .foregroundColor(Color.white)
                                .background(.icon)
                                .cornerRadius(12)
                                .font(.system(size: 20 ))
                                .foregroundColor(.white)
                                .padding(.top,50)
                            
                            
                            
                            
                            //
                            //                .disabled(((FirstDestination?.isEmpty) != nil) && (TripType != nil) && Time.isEmpty && PNum.isEmpty)
                            
                        }.tag(2)
                        
                        VStack{
                            
                            
                            
                            
                            Text("عنوان المنشور:*")
                           
                            .padding(.trailing,250)
                            TextField("", text: $tittle)
                                .frame(width: 333 , height: 44)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                              
                            
                           
                            
                            Text("الملاحظات:")
                                .padding(.trailing,220)
                            TextField("", text: $notes)
                                .frame(width: 333 , height: 174)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.headline)
                            
                            
                            Button("التالي") {
                                
                                withAnimation{
                                    
                                    selection = 0
                                    
                                }
                            } .frame(width: 350 , height: 50)
                                .foregroundColor(Color.white)
                                .background(.icon)
                                .cornerRadius(12)
                                .font(.system(size: 20 ))
                                .foregroundColor(.white)
                                .padding(.top,50)
                            
                            
                            
                            
                            //
                            //                .disabled(((FirstDestination?.isEmpty) != nil) && (TripType != nil) && Time.isEmpty && PNum.isEmpty)
                            
                        }.tag(3)
                        
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    
                    
                    
                    
                    
                    
                    
                        .toolbar(content : {
                            
                            ToolbarItem(placement: .topBarTrailing) {
                                
                                NavigationLink(destination: MainPage()) {
                                    
                                    Text("تخطي")
                                        .foregroundColor(.icon)
                                        .bold()
                                    
                                }   .navigationBarHidden(true)       .navigationBarBackButtonHidden(true)
                                    
                                
                            }
                           
//                            ToolbarItem(placement: .topBarLeading) {
//
//                                Button(action: {
//                                    presentationMode.wrappedValue.dismiss()
//                                }) {
//                                    Image(systemName: "chevron.right")
//                                        .foregroundColor(.icon)
//                                }
//                            }
                            
                            
                            
                            
                            
                        })
                    
                    
                    
                    
                    
                }
                
                
                
            }
        }}
      




enum DropDownPickerState {
        case top
        case bottom
    }

        struct DropDownPicker: View {
            
            @Binding var selection: String?
            var state: DropDownPickerState = .bottom
            var options: [String]
            var maxWidth: CGFloat = 180
            
            @State var showDropdown = false
            @SceneStorage("drop_down_zindex") private var index = 1000.0
            @State var zindex = 1000.0
            
            
            var body: some View {
                
                GeometryReader {
                    let size = $0.size
                    
                    VStack(spacing: 0) {
                        
                        
                        if state == .top && showDropdown {
                            OptionsView()
                        }
                        
                        HStack {
                            
                            Text(selection == nil ? "" : selection!)
                                .foregroundColor(selection != nil ? .black : .gray)
                            
                            
                            Spacer(minLength: 0)
                            
                            Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                                .font(.title3)
                                .foregroundColor(.gray.opacity(0.5))
                                .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                        }
                        .padding(.horizontal, 15)
                        .frame(width: 333 , height: 44)
                        .background(Color.white)
                        .onTapGesture {
                            index += 1
                            zindex = index
                            withAnimation(.snappy) {
                                showDropdown.toggle()
                            }
                        }
                        .zIndex(10)
                        
                        if state == .bottom && showDropdown {
                            OptionsView()
                        }
                        
                    }
                    .clipped()
                    .background(.white)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white)
                        
                        
                    }
                    .frame(height: size.height, alignment: state == .top ? .bottom : .top)
                    
                }
                .frame(width: maxWidth, height: 50)
                .zIndex(zindex)
            }
       
        
        func OptionsView() -> some View {
            VStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option)
                        Spacer()
                      
                            .opacity(selection == option ? 1 : 0)
                    }
                    .foregroundStyle(selection == option ? Color.primary : Color.gray)
                    .animation(.none, value: selection)
                    .frame(height: 40)
                    .contentShape(.rect)
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selection = option
                            showDropdown.toggle()
                        }
                    }
                }
            }
            
            .transition(.move(edge: state == .top ? .bottom : .top))
            .zIndex(1)
        }}



#Preview {
    RegisteringPost_P()
}


