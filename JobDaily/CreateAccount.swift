// xcode: set sdk=iOS

//
//  CreateAccount.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  Responsible for account creation after the welcome splash page

import SwiftUI
// TODO: Add red borders if user input is invalid on account creation attempt with a footnote stating what the error is in red

struct CreateAccount: View {
    let title: String = "Create an Account"
    let subtitle: String = "Just a few quick things to get started"
    let currentStep: Int = 1
    let totalSteps: Int = 4
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConf: String = ""
    @State private var hiding: Bool = true // The text in the field is hashed by default
    @State private var showAlert = false
    @State private var isLoading = false
    @State private var nextScreen = false
    @State private var complete = false
    
    var body: some View {
        NavigationView {
            VStack{
                ProgressHeader(title: title, subtitle: subtitle, currentStep: currentStep, totalSteps: totalSteps)
                
                Text("Sign up with")
                    .padding(.top, 20)
                
                HStack(spacing: 125) {
                    // For Google Account linking
                    Button("Google"){
                        showAlert = true
                    }
                    .padding(.top, 10)
                    .foregroundColor(.black)
                    .alert("TODO: IMPLEMENT GOOGLE AUTH", isPresented: $showAlert) {
                        Button("OK", role: .cancel){}
                    }
                    message: {
                        Text("GOOGLE AUTH NOT IMPLEMENTED AT THIS TIME")
                    }
                    
                    // For Apple Account Linking
                    Button("Apple"){
                        showAlert = true
                    }
                    .padding(.top, 10)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .alert("TODO: IMPLEMENT GOOGLE AUTH", isPresented: $showAlert) {
                        Button("OK", role: .cancel){}
                    }
                    message: {
                        Text("APPLE AUTH NOT IMPLEMENTED AT THIS TIME")
                    }
                }
                .padding(.bottom, 10)
                Spacer()
                // TODO: Create the "----- or -----" under the Google and Apple and above the fields
                
                // Text Fields for the user to input information
                VStack(alignment: .leading, spacing: 10) {
                    Text("First Name*")
                        .padding(.horizontal)
                    TextField("", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    
                    Text("Last Name*")
                        .padding(.horizontal)
                    TextField("", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    
                    Text("Email*")
                        .padding(.horizontal)
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                    
                    // Secure Fields for password and password confirmation will go from hashed to not hashed when the user presses the eye icon in the text field
                    Text("Password*")
                        .padding(.horizontal)
                    ZStack {
                        SecureField("", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        
                        Image(systemName: hiding ? "eye.slash.fill" : "eye.fill")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    Text("Confirm Password*")
                        .padding(.horizontal)
                    
                    ZStack {
                        SecureField("", text: $passwordConf)
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        
                        Image(systemName: hiding ? "eye.slash.fill" : "eye.fill")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    .padding(.bottom, 10)
                    
                }
                // TODO: The next page should not be accessible until all fields are filled
                // Gray = Not all spots filled / errors present
                // Black = User able to attempt login
                NavigationLink(destination: ResumeUpload()){
                    Text("Continue->")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                    //                        .background(!complete ? Color.gray : Color.black)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
        
    }
}

// When the user attempts to create an account, this function validates if the values put into the fields are valid, makes the LoadingOverlay appear and either

// Inputs valid - move onto the next step

// Inputs not valid - the value not valid has the text box in red and redirects them back to this screen

func validate () {
    
}

func simulateLoading() {
    
}


#Preview {
    CreateAccount()
}
