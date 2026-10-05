//
//  WelcomePage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  The first screen seen by the user. Asks if the user wants to either log in or create an account
// Jeremiah working on this one

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Image(systemName: "circle.fill")
                    .foregroundStyle(.black)
                .font(.system(size: 90))
                Text("Logo Here") // Message should be seen within the circle to represent where the logo goes
                    .foregroundStyle(.white)
            }
            // shorten the gap between these two
            Text("Job Daily")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Button("Get Started") {
                // Takes user to account creation
                // TODO: Make it to where the button is at the bottom of the screen and takes up the width of the screen
            }
            .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity) //  Expands to fill all available horizontal space
                    .background(Color.black)
                    .cornerRadius(10)
            HStack{
                Text("Already have an account?")
                Button("Log In"){
                    // Send the user to the log in screen
                }
                .tint(.blue)
            }
            
        }
    }
}

#Preview {
    WelcomePage()
}
