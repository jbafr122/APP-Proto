//
//  Login.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  User inputs their credentials and skips onboarding to reach the app home page

import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var hiding: Bool = true // true by default and changes when the user presses the eye icon
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Log In")
                    .font(.largeTitle)
                Text("Welcome Back")
                    .frame(height: 10)
                Text("Username or Email")
                // Add space in between
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 40)
                    .padding(.horizontal)
                
                TextField("", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                    .padding(.horizontal)
                
                Text("Password")
                // Add space in between
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                ZStack{
                    TextField("", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    // Add the hashing eye password button thing
                    // TODO: Make it to where the password is hashed when hiding is true and not hashed otherwise
                    Image(systemName: hiding ? "eye.slash.fill" : "eye.fill")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                }
                
                // Add forgot password button under text field
                
                // TODO: Make it to where the Log In button is pressable and black if both fields are filled and grey and unpressable otherwise
                NavigationLink(destination: HomePage()){
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                }
                
                // To create account screen
                HStack {
                    Text("Don't have an account?")
                    NavigationLink (destination: CreateAccount()) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                }
            }
            
        }
        
    }
}


#Preview {
    Login()
}
