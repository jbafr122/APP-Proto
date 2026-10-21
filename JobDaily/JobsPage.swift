//
//  JobsPage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/20/26.
//

import SwiftUI

struct Job: Identifiable {
    let id = UUID()
    let jobTitle: String
    let company: String
    let location: String
    let postDate: String
    var saved: Bool
    var status: JobStatus = .notapp
}

struct JobsPage: View {
    // For the navigation to edit page
    @State private var showEdit = false
    
    @State var searchText: String = ""
    @State var preferredRoles = [
        Job(jobTitle: "UI/UX Designer",
            company: "Meta",
            location: "Austin, TX",
            postDate: "Today",
            saved: false),
        Job(jobTitle: "SWE Intern",
            company: "Google",
            location: "Austin, TX",
            postDate: "Today",
            saved: false),
        Job(jobTitle: "Marketing Intern",
            company: "TikTok",
            location: "Austin, TX",
            postDate: "Today",
            saved: false),
        Job(jobTitle: "SWE I",
            company: "Amazon",
            location: "Austin, TX",
            postDate: "Today",
            saved: false),
        Job(jobTitle: "Product Manager",
            company: "Citi",
            location: "Austin, TX",
            postDate: "Today",
            saved: false)
    ]
    
    // Dynamically filter jobs by title or company name based on search text
    var filteredJobs: [Job] {
        if searchText.isEmpty {
            return preferredRoles
        } else {
            return preferredRoles.filter { job in
                job.jobTitle.localizedCaseInsensitiveContains(searchText) ||
                job.company.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    // Safely binds filtered items back to the source preferredRoles state
    private func binding(for job: Job) -> Binding<Job> {
        guard let index = preferredRoles.firstIndex(where: { $0.id == job.id }) else {
            fatalError("Job not found in preferred roles list")
        }
        return $preferredRoles[index]
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                Text("Jobs")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .font(.largeTitle)
                    .bold()
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search roles or companies", text: $searchText)
                }
                .autocorrectionDisabled()
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(30)
                .padding(.horizontal)
                
                HStack {
                    Text("Based on your preferences")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Button {
                        showEdit = true
                    } label: {
                        Text("Edit")
                            .bold()
                    }
                    .padding(.horizontal)
                    .foregroundStyle(.black)
                }
                
                List {
                    ForEach(filteredJobs) { item in
                        let jobBinding = binding(for: item)
                        
                        JobRowView(job: jobBinding)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .fullScreenCover(isPresented: $showEdit) {
            PreferenceEdit(showingEditPage: $showEdit)
        }
    }
}

// Represents one job entry with Bookmark and Apply actions
struct JobRowView: View {
    @Binding var job: Job

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "circle")
                .font(.title2)
                .padding(.top, 2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(job.jobTitle)
                    .font(.headline)
                    .lineLimit(1)
                
                Text("\(job.company) · \(job.location)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Text("Posted \(job.postDate)")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding(.top, 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Action Buttons Column
            VStack(spacing: 8) {
                // Bookmark / Save Button
                Button {
                    job.saved.toggle()
                } label: {
                    Image(systemName: job.saved ? "bookmark.fill" : "bookmark")
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                .buttonStyle(.plain)

                // Apply Button
                Button {
                    // Perform apply action
                } label: {
                    Text("Apply")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .buttonStyle(.plain)
            }
            .fixedSize(horizontal: true, vertical: false)
        }
        .padding(16)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.5)
                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}

#Preview {
    JobsPage()
}
