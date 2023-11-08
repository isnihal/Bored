//
//  LottieView.swift
//  Bored
//
//  Created by Nihal Ismail on 11/8/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable{
    let name: String
    let loop: Bool
    
    init(name: String, loop: Bool = true) {
        self.name = name
        self.loop = loop
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let view = LottieAnimationView(name: name, bundle: Bundle.main)
        view.loopMode = loop ? .loop : .playOnce
        view.contentMode = .scaleAspectFit
        view.play()
        return view
    }
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {}
}
