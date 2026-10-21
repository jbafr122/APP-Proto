//
//  StreakPage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/20/26.
//

import SwiftUI

struct StreakPage: View {
    @Binding var showStreak: Bool
    var body: some View {
        VStack (alignment: .center){
            Image(systemName: "flame")
                .font(.system(size: 60, weight: .bold))
            Text("12 Day Streak")
                .font(.title)
            Text("Nice work showing up, your next tip unlocks tomorrow")
                .font(.title3)
                .padding()
            Button{
                showStreak = false
            }
            label: {
                Text("Go Home")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 7)
                    .foregroundStyle(.black)
                    .font(.title2)
                    .overlay (
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.5)
                            .stroke(Color(red: 1, green: 1, blue: 1), lineWidth: 2)
                    )
            }
        }
        //.frame(maxWidth: .infinity, alignment: .leading)
        .frame(maxWidth: .infinity)
        .padding()
        //.padding(16)
        //.frame(width: 370, height: 102)
//        .background(.white)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.5)
                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
        )
        .padding(.horizontal, 20)
        //.frame(maxHeight: .infinity, alignment: .top)
    }
}

//#Preview {
//    StreakPage()
//}
