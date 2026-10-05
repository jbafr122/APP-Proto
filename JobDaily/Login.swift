//
//  Login.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  User inputs their credentials and skips onboarding to reach the app home page 
// Jeremiah working on this one
import SwiftUI

struct Login: View {
    var body: some View {
        VStack{
            ZStack{
                Image(systemName: "circle.fill")
                .font(.system(size: 90))
                Text("Logo Here") // Message should be seen within the circle to represent where the logo goes
                    .tint(.red)
            }
            // shorten the gap between these two
            Text("Job Daily")
                .font(.largeTitle)
                .fontWeight(.bold)
            Button("Get Started") {
                // Takes user to account creation
                // TODO: Make it to where the button is at the bottom of the screen and takes up the width of the screen
            }
            .frame(width: 400)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.black) // TODO: Resemble the app accent colors later
            .padding()
            Text("Already have an account? Log In")
        }
    }
}

#Preview {
    Login()
}
