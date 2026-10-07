//
//  WelcomePage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  The first screen seen by the user. Asks if the user wants to either log in or create an account

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                ZStack{
                    Image(systemName: "circle.fill")
                        .foregroundStyle(.black)
                        .font(.system(size: 90))
                    Text("Logo Here") // Message should be seen within the circle to represent where the logo goes
                        .foregroundStyle(.white)
                }
                Text("Job Daily")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                
                // User decides to press create account
                NavigationLink(destination: CreateAccount()) {
                    Text("Get Started ->")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                }
                
                // Log in option
                HStack{
                    Text("Already have an account?")
                    NavigationLink(destination: Login()) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    .tint(.blue)
                }
                
            }
        }
    }
}

#Preview {
    WelcomePage()
}
