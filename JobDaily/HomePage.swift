//
//  HomePage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/5/26.
//  The landing page for once the user logs in or completes the onboarding

import SwiftUI

struct HomePage: View {
    @State private var showingStreakPage = false
    @State private var showingTipPage = false
    var body: some View {
        NavigationStack() {
            VStack{
                HStack {
                    VStack {
                        Text("Tuesday")
                            .font(.title2)
                        Text("Hello, Name")
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    Button {
                        showingStreakPage = true
                    } label: {
                        Text("\(Image(systemName: "flame")) 12 Days")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(100)
                            .padding()
                    }
//                    NavigationLink(destination: ResumeUpload()){
//                        Text("\(Image(systemName: "flame")) 12 Days")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
////                            .frame(maxWidth: .infinity)
//                            .background(Color.black)
//                            .cornerRadius(100)
//                            .padding()
//                    }
                    
                }
                .padding()
                Button {
                    showingTipPage = true
                } label: {
                    HStack {
                        VStack (alignment: .leading){
                            HStack (alignment: .top){
                                Image(systemName: "lightbulb")
                                    .font(.largeTitle)
                                VStack (alignment: .leading){
                                    Text("Today's Tip")
                                        .font(.title3)
                                    Text("Message one person before you apply")
                                        .font(.title2)
                                    
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        //.padding()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                    .padding(16)
                    //.frame(width: 370, height: 102)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(20)
                    .overlay (
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .frame(maxHeight: .infinity, alignment: .top)
                }
                .foregroundStyle(.black)
            }
        }
        .fullScreenCover(isPresented: $showingStreakPage) {
            StreakPage(showStreak: $showingStreakPage)
        }
        .fullScreenCover(isPresented: $showingTipPage) {
            TipPage(showTip: $showingTipPage)
        }
    }
}

#Preview {
    HomePage()
}
