//
//  LoadingViews.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            LottieView(name: "loading")
                .scaleEffect(CGSize(width: 0.35, height: 0.35))
                .frame(width: 300,height: 300)
            Text("Finding something for you...")
                .font(.system(size: 24))
                .italic()
                .fontWeight(.medium)
                .padding()
        }
    }
}

#Preview {
    LoadingView()
}
