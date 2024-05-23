//
//  AppInterface.swift
//  Q-Lnk
//
//  Created by Amal Mohammad Alreshi on 22/05/2024.
//


import SwiftUI
import AuthenticationServices


struct AppInterface: View {
    
    @State var appeared: Double = 0
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @Environment (\.colorScheme) var colorScheme
    @State private var isTabBarActive = false
    
    var body: some View {
        
        
        NavigationStack {
            
            
            ZStack{
                
                Color(.background).ignoresSafeArea()
                
                VStack{
                    
                    HStack(spacing:40){
                        
                        
                        
                        NavigationLink(destination: MainPage()) {
                            VStack{
                                Image(systemName: "person.fill")
                                    .font(.system(size: 40 ))
                                    .foregroundColor(.icon)
                                Text("راكب")
                                    .foregroundColor(.black)
                                
                            }
                            
                        }
                        
                        
                        
                        Divider()
                            .frame(height: 45)
                        
                        
                        VStack{
                            
                            Image(systemName: "car.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.icon)
                            Text("سائق")
                                .foregroundColor(.black)
                            
                        }
                        
                        
                        
                        
                        
                    } //End HStack
                    VStack{
                        Text("هل لديك حساب بالفعل ؟")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        //to sign in with apple id
                        SignInWithAppleButton(.continue){ request in
                            
                            request.requestedScopes = [.email , .fullName]
                        } onCompletion: { result in
                            
                            switch result {
                            case .success(let auth):
                                
                                switch auth.credential{
                                case let credential as ASAuthorizationAppleIDCredential:
                                    
                                    // user info
                                    let email = credential.email
                                    let firstName = credential.fullName?.givenName
                                    let lastName = credential.fullName?.familyName
                                    
                                    //get it from storge
                                    self.email = email ?? ""
                                    self.firstName = firstName ?? ""
                                    self.lastName = lastName ?? ""
                                    
                                default:
                                    break
                                }
                                
                            case .failure(let error):
                                print(error)
                            }
                            //end button Apple Id
                        }
                        // if dark mode make it white , light mode balck
                        .signInWithAppleButtonStyle(colorScheme == .light ? .white : .black)
                        .frame(width: 372 , height: 50)
                        .cornerRadius(20)
                        .padding(.top, 20)
                        
                        
                        
                        
                    } .padding(.top,250)
                    
                    
                    
                    
                    
                    
                    
                }
                    .padding(.top,200)
                    
                    
                }
            }
        }
    }

#Preview {
    AppInterface()
}
