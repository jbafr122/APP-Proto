//
//  HomePage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  The landing page for once the user logs in or completes the onboarding

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack{
            Text("Job advice here")
                .padding(.top)
            Spacer()
            Image(systemName: "person.fill")
                .font(.system(size: 50))
            Text("Hello User")
            Spacer()
            HStack{
                VStack{
                    Image(systemName: "document")
                    Text("Application Feed")
                }
                .padding(.horizontal)
                Spacer()
                VStack{
                    Image(systemName: "clock.badge.fill")
                    Text("Application Status")
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomePage()
}
