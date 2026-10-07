// xcode: set sdk=iOS

//
//  YourSkills.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  User either manually or automatically loads skills from resume (not sure if it needs to be 1 or 2 screens but 1 should be good)

import SwiftUI

//struct CategoryItem: Identifiable, Hashable {
//    let id = UUID()
//    let name: String
//}

struct YourSkills: View {
    @State private var minSkills = 0 // The minimmum number of skills the suer must select to move on
    @State private var showDuplicateAlert = false
    // Placeholder categories for the prototype
    @State var categories = [
        CategoryItem(name: "C++"),
        CategoryItem(name: "Java"),
        CategoryItem(name: "Python"),
        CategoryItem(name: "Swift"),
        CategoryItem(name: "Rust")
    ]
    
    @State private var searchText: String = ""
    
    
    var body: some View {
        NavigationStack{
            ProgressHeader(title: "Your Skills", subtitle: "Enter your relevant skills. \nSwipe to delete", currentStep: 2, totalSteps: 4)
            
                .padding(.horizontal)
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Add Skill...", text: $searchText)
                    .onSubmit {
                        guard !searchText.isEmpty else { return }
                            addItem(newAddition: searchText)
                            var newCategory = CategoryItem(name: searchText)
                    }
            }
            .autocorrectionDisabled()
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            
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
            NavigationLink(destination: YourInterests()){
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
    
    
    


#Preview {
    YourSkills()
}
