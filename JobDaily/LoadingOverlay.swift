//
//  LoadingOverlay.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  Using this for the loading screen inbetween transitions. Save this for later

import SwiftUI

struct LoadingOverlay: View {
    var body: some View {
        ZStack {
            // Darkens the background behind the spinner
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView()
                    .progressViewStyle(.circular)
                    .tint(.white)
                    .scaleEffect(1.5)
            }
            
        }
    }
}

#Preview {
    LoadingOverlay()
}
