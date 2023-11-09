//
//  ErrorView.swift
//  Bored
//
//  Created by Nihal Ismail on 11/9/23.
//

import SwiftUI

struct ErrorView: View {
    
    var viewModel: ActivityViewModel?
    
    var body: some View {
        VStack{
            Spacer()
            LottieView(name: "error")
                .scaleEffect(0.8)
                .frame(height: 300)
                .padding()
            Text("Something went wrong\nPlease try again!")
                .font(.system(size: 24))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top,32)
            Spacer()
            Button(action: {
                viewModel?.loadActivity()
            }, label: {
                Text("Try Again")
                    .font(.title2)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                           maxHeight: 60
                    )
                    .foregroundStyle(Color(uiColor: .label))
            })
            .background(.colorSocial,in: .capsule)
            .padding()
        }
    }
}

#Preview {
    ErrorView()
}
