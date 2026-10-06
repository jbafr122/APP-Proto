// xcode: set sdk=iOS

//
//  YourSkills.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  User either manually or automatically loads skills from resume (not sure if it needs to be 1 or 2 screens but 1 should be good)

import SwiftUI

struct YourSkills: View {
    var body: some View {
        ProgressHeader(title: "Your Skills", subtitle: "Enter your skills and experiences", currentStep: 2, totalSteps: 4)
    }
}

#Preview {
    YourSkills()
}
