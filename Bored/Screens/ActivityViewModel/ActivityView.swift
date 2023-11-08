//
//  ContentView.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import SwiftUI

struct ActivityView: View {
    
    var viewModel = ActivityViewModel()
    
    var body: some View {
        VStack{
            if viewModel.isLoading{
                ProgressView()
            } else{
                if let activity = viewModel.activity{
                    VStack {
                        Spacer()
                        LottieView(name: "education", loop: true)
                            .scaleEffect(CGSize(width: 0.5, height: 0.5))
                            .frame(width: 300,height: 300)
                        Text(activity.activity)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.top,48)
                        
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Link(destination: viewModel.activityLink, label: {
                                Text("Get Started")
                                    .font(.title2)
                                    .bold()
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                                           maxHeight: 60
                                    )
                                    .foregroundStyle(Color(uiColor: .label))
                            })
                        })
                        .background(.brandPrimary, in: .capsule)
                        .padding(.bottom)
                    }
                    .padding()
                    .overlay(alignment: .topTrailing, content: {
                        Button(action: {
                            viewModel.loadActivity()
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                                .padding()
                                .imageScale(.large)
                                .foregroundStyle(Color(uiColor: .label ))
                                .background(.brandPrimary, in: .circle)
                        })
                        .padding(.trailing)
                    })
                }
            }
        }
        .task {
            viewModel.loadActivity()
        }
        
    }
}

#Preview {
    ActivityView()
}
