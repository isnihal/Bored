//
//  ContentView.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "figure.surfing")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
            
            Text("Learn Surfing")
                .font(.largeTitle)
                .bold()
                .padding(.top,48)
            
            Spacer()
            Button(action: {}, label: {
                Text("Get Started")
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                           maxHeight: 60
                    )
                    .foregroundStyle(Color(uiColor: .label))
            })
            .background(.brandPrimary, in: .capsule)
            .padding(.bottom)
        }
        .padding()
        .overlay(alignment: .topTrailing, content: {
            Button(action: {}, label: {
                Image(systemName: "arrow.clockwise")
                    .padding()
                    .imageScale(.large)
                    .foregroundStyle(Color(uiColor: .label ))
                    .background(.brandPrimary, in: .circle)
            })
        })
    }
}

#Preview {
    ActivityView()
}
