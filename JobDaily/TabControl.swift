//
//  TabControl.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/20/26.
//

import SwiftUI
// Tab Manager for Home Screen
struct TabControl: View {
    var body: some View {
        TabView {
            HomePage()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            JobsPage()
            .tabItem {
                Label("Jobs", systemImage: "suitcase")
            }
            TrackerPage()
            .tabItem {
                Label("Tracker", systemImage: "list.bullet.clipboard")
            }
            ProfilePage()
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
    }
}

#Preview {
    TabControl()
}
