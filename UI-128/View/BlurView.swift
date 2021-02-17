//
//  BlurView.swift
//  UI-128
//
//  Created by にゃんにゃん丸 on 2021/02/17.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect:UIBlurEffect(style: .systemChromeMaterial))
            return view
        
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

