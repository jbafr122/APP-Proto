//
//  TipPage.swift
//  JobDaily
//
//  Created by Jeremiah Franklin on 10/20/26.
//

import SwiftUI

struct TipPage: View {
    @Binding var showTip: Bool
    var body: some View {
        VStack (alignment: .center){
            Image(systemName: "lightbulb")
                .font(.system(size: 60, weight: .bold))
            Text("Message One Person Before You Apply")
                .font(.title)
            Text("A short note to someone at the company can move you out of the pile. Recruiters see hundreds of applications, but a real message from a student or recent grad stands out. \n\n Keep it simple: say who you are, mention the role, and ask one specific question about the team or the work.")
                .font(.title3)
                .padding()
            Button{
                showTip = false
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
//    TipPage()
//}
