//
//  YourInterests.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  What jobs the user is interested in. List multiple job titles that match up with the skills and allow the user to select them.

import SwiftUI

// Right now a global struct. In future implementation will be its own swift file or replaced with String lists wherever this struct is used
struct CategoryItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

struct YourInterests: View {
    @State private var minSkills = 0 // The minimmum number of skills the suer must select to move on
    @State private var showDuplicateAlert = false
    // Placeholder categories for the prototype
    @State var categories = [
        CategoryItem(name: "Environment"),
        CategoryItem(name: "Fashion"),
        CategoryItem(name: "Art"),
        CategoryItem(name: "Music"),
        CategoryItem(name: "Artificial Intelligence")
    ]
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack{
            ProgressHeader(title: "Your Interests", subtitle: "Help us match you to relevant experiences. \nSwipe to delete", currentStep: 3, totalSteps: 4)
                .padding(.horizontal)
            // Search for adding interests
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Add Category...", text: $searchText)
                    .onSubmit {
                        guard !searchText.isEmpty else { return }
                        addItem(newAddition: searchText)
                    }
            }
            .autocorrectionDisabled()
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Lists out the added interests into a list that is removable with swiping
            List (){
                ForEach(categories, id: \.self) { category in
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
            Spacer()
            
            // After the user selects the minimum number of skills, the button will activate and allow the user to move onto the next step
            NavigationLink(destination: JobSpec()){
                Text("Continue ->")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(categories.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(10)
                    .padding()
            }
            .disabled(categories.isEmpty)
            
            // Onboarding Workflow does not specify where to send the user if the option is selected so this is a placeholder
            NavigationLink(destination: JobSpec()){
                Text("Skip for now")
                    .foregroundStyle(Color.black)
                    .underline()
            }
        }
        .alert("Duplicate Text", isPresented: $showDuplicateAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("'\(searchText)' is already added.")
        }
    }
    
    // Add interests
    private func deleteItems(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    
    private func addItem (newAddition: String) {
        let isDuplicate = categories.contains { (category: CategoryItem) in category.name.caseInsensitiveCompare(searchText) == .orderedSame}
        
        if isDuplicate {
            showDuplicateAlert = true
        }
        else {
            categories.append(CategoryItem(name: searchText))
            searchText = ""
        }
    }
}


//ScrollView {
//              LazyVGrid(columns: [GridItem(.adaptive(minimum: 180))], alignment: .leading, spacing: 10) {
//                  ForEach(categories) { category in
//                      Button(action: {
//                          // Toggle logic for selected category
//                          if selectedCategories.contains(category) {
//                              selectedCategories.remove(category)
//                              if category.custom {
//                                  categories.remove()
//                              }
//                          } else {
//                              selectedCategories.insert(category)
//                          }
//                      }) {
//                          Text(category.name)
//                              .font(.title2)
//                              .lineLimit(1) // Keep text on a single line
//                              .truncationMode(.tail)
//
//                              .padding(.horizontal, 16)
//                              .padding(.vertical, 10)
//                              // Change style based on if selected
//                              .background(selectedCategories.contains(category) ? Color.black : Color(.systemGray6))
//                          // .systemGray gives the clear background color to the pill buttons
//                              .foregroundColor(selectedCategories.contains(category) ? .white : .black)
//                              .cornerRadius(10)
//
//                      }
//                  }
//              }
//              .padding(.horizontal)
//          }



#Preview {
    YourInterests()
}
