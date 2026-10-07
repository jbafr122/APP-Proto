//
//  JobSpec.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
// The user specifies what type of jobs they want (Remote, In person, Hybrid) and what level (Full time, Intern, Part Time)

import SwiftUI

//struct location {
//
//}

struct JobSpec: View {
    @State private var searchText:String = ""
    @State private var minSalary:String = ""
    @State private var maxSalary:String = ""
    @State private var complete = false // Has the user provided input for all of the fields
    @State private var locations:[String] = ["Remote"]
    let workOptions = ["Part-time", "Internship", "Full-time", "Co-op"]
    @State private var selected: Set<String> = []
    @State private var showDuplicateLocation = false
    @State private var showDuplicateTitle = false
    
    // job title variables
    @State private var titles:[CategoryItem] = []
    @State private var titleText:String = ""
    
    var body: some View {
        NavigationStack{
            ProgressHeader(title: "What are you looking for?", subtitle: "", currentStep: 4, totalSteps: 4)
            
            Text("Location")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Add Location...", text: $searchText)
                    .onSubmit {
                        guard !searchText.isEmpty else { return }
                        addLocations(newAddition: searchText)
                    }
            }
            .autocorrectionDisabled()
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Adds locations in the locations list and appends an x mark that removes them when pressed
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(locations, id: \.self) { name in
                        HStack(spacing: 6) {
                            Text(name)
                            Button {
                                withAnimation {
                                    locations.removeAll { $0 == name }
                                }
                            }
                            label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.secondary)
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Capsule().fill(Color.gray.opacity(0.15)))
                    }
                }
                .padding(.horizontal)
            } // end first scrollview
            
            Spacer()
            Text("Work Type")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Creates buttons for the work options based on what is in the workOptions list, when a user presses
            // one they change color and are added to the isSelected set to remember which options are selected
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(workOptions, id: \.self) { name in
                        let isSelected = selected.contains(name)
                        Button {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                if isSelected {
                                    selected.remove(name)
                                } else {
                                    selected.insert(name)
                                }
                            }
                        } label: {
                            Text(name)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .foregroundStyle(isSelected ? .white : .primary)
                                .background(Capsule().fill(isSelected ? .black : Color.gray.opacity(0.15)))
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
                .padding(.horizontal)
            } // end second scrollview
            
            Spacer()
            Text("Salary Range")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Two text fields in which the user is allowed to enter what min or max salary they
            // prefer in a job posting
            HStack {
                HStack {
                    TextField("Min Salary", text: $minSalary)
                    //                        .onSubmit {
                    //                            guard !searchText.isEmpty else { return }
                    //                            addLocations(newAddition: searchText)
                    //                        }
                }
                .autocorrectionDisabled()
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                Text("to")
                HStack {
                    TextField("Max Salary", text: $maxSalary)
                    //                        .onSubmit {
                    //                            guard !searchText.isEmpty else { return }
                    //                            addLocations(newAddition: searchText)
                    //                        }
                }
                .autocorrectionDisabled()
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            
            Spacer()
            // Job Titles
            Text("Job Titles")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            // Search bar for job titles
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Add Category...", text: $titleText)
                    .onSubmit {
                        guard !titleText.isEmpty else { return }
                        addItem(newAddition: titleText)
                    }
            }
            .autocorrectionDisabled()
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // List of job titles, swipe to delete
            List (){
                ForEach(titles, id: \.self) { category in
                    Text(category.name)
                }
                .onDelete(perform: deleteItems)
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .clipShape(Capsule())
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
            .scrollContentBackground(.hidden)
            
            NavigationLink(destination: HomePage()){
                Text("Continue ->")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(complete ? Color.gray : Color.black)
                    .cornerRadius(10)
                    .padding()
            }
        }
        // Alerts for if duplicates are entered in the location or job title fields
        .alert("Duplicate Text", isPresented: $showDuplicateLocation) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("'\(searchText)' is already added.")
        }
        .alert("Duplicate Text", isPresented: $showDuplicateTitle) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("'\(titleText)' is already added.")
        }
        
    }
    // Swipe to delte job titles
    private func deleteItems(at offsets: IndexSet) {
        titles.remove(atOffsets: offsets)
    }
    
    // Add job titles
    private func addItem (newAddition: String) {
        let isDuplicate = titles.contains { (category: CategoryItem) in category.name.caseInsensitiveCompare(titleText) == .orderedSame}
        
        if isDuplicate {
            showDuplicateTitle = true
        }
        else {
            titles.append(CategoryItem(name: titleText))
            titleText = ""
        }
    }
    
    // add locations
    private func addLocations (newAddition: String) {
        let isDuplicate = locations.contains { $0.caseInsensitiveCompare(newAddition) == .orderedSame}
        
        if isDuplicate {
            showDuplicateLocation = true
        }
        else {
            locations.append(newAddition)
            searchText = ""
        }
    }
}

#Preview {
    JobSpec()
}
