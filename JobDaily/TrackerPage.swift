//
//  TrackerPage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/20/26.
//  Allows the user to modify the status of each application, search for indivual entries and filter by category
// TODO: Create an individual file for the enm and Job struct to clean up the code

import SwiftUI

enum JobStatus: String, CaseIterable, Identifiable {
    case applied = "Applied"
    case interviewing = "Interviewing"
    case notapp = "Not Applied"
    
    var id: String { self.rawValue }
}

struct TrackerPage: View {
    @State var searchText: String = ""
    @State private var selectedFilter: String = "All"
    
    @State var trackedJobs = [
        Job(jobTitle: "UI/UX Designer",
            company: "Meta",
            location: "Austin, TX",
            postDate: "Today",
            saved: false,
            status: .notapp),
        Job(jobTitle: "SWE Intern",
            company: "Google",
            location: "Austin, TX",
            postDate: "Today",
            saved: false,
            status: .applied),
        Job(jobTitle: "Marketing Intern",
            company: "TikTok",
            location: "Austin, TX",
            postDate: "Today",
            saved: false,
            status: .interviewing),
        Job(jobTitle: "SWE I",
            company: "Amazon",
            location: "Austin, TX",
            postDate: "Today",
            saved: false,
            status: .notapp),
        Job(jobTitle: "Product Manager",
            company: "Citi",
            location: "Austin, TX",
            postDate: "Today",
            saved: false,
            status: .applied)
    ]
    
    var filterOptions: [String] {
        ["All"] + JobStatus.allCases.map { $0.rawValue }
    }
    
    // Dynamic array filtered by both search text and status selector
    var filteredJobs: [Job] {
        trackedJobs.filter { job in
            let matchesSearch = searchText.isEmpty ||
                job.jobTitle.localizedCaseInsensitiveContains(searchText) ||
                job.company.localizedCaseInsensitiveContains(searchText)
            
            let matchesFilter = (selectedFilter == "All") || (job.status.rawValue == selectedFilter)
            
            return matchesSearch && matchesFilter
        }
    }
    
    // Safely binds filtered items back to the source trackedJobs state
    private func binding(for job: Job) -> Binding<Job> {
        guard let index = trackedJobs.firstIndex(where: { $0.id == job.id }) else {
            fatalError("Job not found in tracked list")
        }
        return $trackedJobs[index]
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                Text("Application Tracker")
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
                
                // Status Filter Segmented Picker
                Picker("Filter Status", selection: $selectedFilter) {
                    ForEach(filterOptions, id: \.self) { option in
                        Text(option).tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.top, 4)
                
                List {
                    ForEach(filteredJobs) { item in
                        let jobBinding = binding(for: item)
                        let job = jobBinding.wrappedValue
                        
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
                            
                            // Custom Status Dropdown Menu Button
                            Menu {
                                ForEach(JobStatus.allCases) { statusOption in
                                    Button {
                                        jobBinding.wrappedValue.status = statusOption
                                    } label: {
                                        HStack {
                                            Text(statusOption.rawValue)
                                            if job.status == statusOption {
                                                Image(systemName: "checkmark")
                                            }
                                        }
                                    }
                                }
                            } label: {
                                HStack(spacing: 4) {
                                    Text(job.status.rawValue)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.caption2)
                                        .foregroundColor(.black)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Color.white)
                                .cornerRadius(20)
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
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .onDelete(perform: deleteJob)
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
    
    // Similar to method from hw. Remove from trackedJobs even when filter is applied
    private func deleteJob(at offsets: IndexSet) {
        let itemsToDelete = offsets.map { filteredJobs[$0].id }
        trackedJobs.removeAll { job in itemsToDelete.contains(job.id) }
    }
}

#Preview {
    TrackerPage()
}
