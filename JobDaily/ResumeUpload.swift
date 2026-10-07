//
//  ResumeUpload.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  User has the option of automatically uploading their resume to have the ai automatically pull key words and define skills to narrow down the job search

import SwiftUI

struct ResumeUpload: View {
    @State private var isImporting = false
    @State private var selectedFileURL: URL?
    @State private var resumeUploaded = false
    // For later: use spacing to simplify indentation for elements rather than individual padding
    
    var body: some View {
        NavigationStack {
            ProgressHeader(title: "Your Skills", subtitle: "Upload your resume to automatically fill in your skills", currentStep: 2, totalSteps: 4)
            //            if !resumeUploaded {
            
            Spacer()
            // Save for proper picture in later implementation
            //            ZStack {
            //                Image("person.circle")
            //            }
            ZStack {
                /// Resume not uploaded
                VStack {
                    Image(systemName: "text.document")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 10)
                    
                    Button("PRESS ME TO UPLOAD RESUME"){
                        // Allow the user to upload a file and check if the file type is valid
                        resumeUploaded.toggle()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding()
                    
                    
                    // If the user decides to manually build their resume
                    NavigationLink(destination: YourSkills()){
                        Text("Manually Build resume instead")
                            .padding(.horizontal, 2)
                            .underline()
                            .padding(.horizontal, -2)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                    }
                }
                .opacity(!resumeUploaded ? 1 : 0)
                
                /// Resume uploaded
                HStack {
                    VStack (alignment: .leading){
                        HStack (alignment: .top){
                            Image(systemName: "document")
                                .font(.title)
                            VStack (alignment: .leading){
                                Text("My_resume2026.pdf")
                                    .font(.title2)
                                Text("PDF 50KB")
                                    .font(.title3)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        Text("Uploaded successfully")
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .foregroundStyle(.black)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(25)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    //.padding()
                    Button{
                        resumeUploaded.toggle()
                    }
                    label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                .padding(16)
                //.frame(width: 370, height: 102)
                .background(.white)
                .cornerRadius(20)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
                .padding(.horizontal, 20)
                .frame(maxHeight: .infinity, alignment: .top)
                .opacity(!resumeUploaded ? 0 : 1)
            }
            Spacer()
            
            // Once the resume is uploaded then activate button
            NavigationLink(destination: YourInterests()){
                Text("Continue ->")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(!resumeUploaded ? Color.gray : Color.black)
                    .cornerRadius(10)
                    .padding()
            }
            .disabled(!resumeUploaded)
            
            // User skips this step and goes to YourInterests
            NavigationLink(destination: YourInterests()){
                Text("Skip for now")
                    .foregroundStyle(Color.black)
                    .underline()
            }
            //            }
            //            else {
            //                Button("TEST"){
            //                    resumeUploaded.toggle()
            //                }
            //            }
        }
        
        
    }
    
}

#Preview {
    ResumeUpload()
}
