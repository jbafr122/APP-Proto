// xcode: set sdk=iOS

//
//  CreateAccount.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  Responsible for account creation after the welcome splash page
// Jeremiah working on this

import SwiftUI

struct CreateAccount: View {
    var body: some View {
        NavigationStack {
            VStack{
                ProgressHeader(title: "TEST", subtitle: "TEST STEP", currentStep: 1, totalSteps: 4)
                Text("Hello")
            }
        }
    }
}

#Preview {
    CreateAccount()
}
