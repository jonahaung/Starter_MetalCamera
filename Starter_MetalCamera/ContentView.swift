//
//  ContentView.swift
//  Starter_MetalCamera
//
//  Created by Aung Ko Min on 18/4/20.
//  Copyright © 2020 Aung Ko Min. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var service = MainService()
    
    var body: some View {
        ZStack{
            MetalViewContainer(service: service)
            
            VStack {
                HStack{
                    Spacer()
                    Text(service.videoService.fps.description)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.service.didAppear()
        }
    }
}

struct MetalViewContainer: UIViewRepresentable {
    
    let service: MainService
    
    func makeUIView(context: Context) -> PreviewMetalView {
        return service.arView
    }
    
    func updateUIView(_ uiView: PreviewMetalView, context: Context) {}
    
}
