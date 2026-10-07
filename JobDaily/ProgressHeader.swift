//
//  ProgressHeader.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  Reusable bar and title ontop to illustrate what step the user is at during the onboarding

import SwiftUI

struct ProgressHeader: View {
    let title: String // Defines the title of the Step we are on
    let subtitle: String // Defines the subheading for each step
    let currentStep: Int // The step we are on (Determines how much of the status bar is filled)
    let totalSteps: Int // Total Steps in the onboarding process (can be deleted and hardcoded later)
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Step \(currentStep) of \(totalSteps)")
                .frame(maxWidth: .infinity, alignment: .trailing)                    .font(.subheadline)
                .foregroundColor(.primary)
            
            //  The Segmented Progress Bar that changes based on currentStep passed in
            HStack(spacing: 8) {
                ForEach(0..<totalSteps, id: \.self) { index in Capsule()
                    //  If the index is less than the current step, fill it with black. Otherwise, light gray.
                        .fill(index < currentStep ? Color.black : Color.gray.opacity(0.3))
                        .frame(height: 6)
                    //  This forces all capsules to share the available width equally
                        .frame(maxWidth: .infinity)
                }
            }
            // Title for Step
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)                    .font(.largeTitle)
            
            // Description or subheading for step
            Text(subtitle)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
}

#Preview {
    ProgressHeader(title: "TEST STEP", subtitle: "this is a test step", currentStep: 1, totalSteps: 4)
}
