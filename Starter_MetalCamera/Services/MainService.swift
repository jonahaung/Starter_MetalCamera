//
//  MainService.swift
//  MyanmarTextScanner
//
//  Created by Aung Ko Min on 17/4/20.
//  Copyright © 2020 Aung Ko Min. All rights reserved.
//

import UIKit
import ARKit

final class MainService: ObservableObject {
    
    let arView = PreviewMetalView()
    let videoService = VideoService()
    private let videoFilter = VideoFilterRenderer()
    
    init() {
        videoService.configure()
        videoFilter.filterType = .Crystal
        videoService.delegate = self
    }
    
    func didAppear() {
        videoService.start()
    }
}

extension MainService: VideoServiceDelegate {
    func videoService(willCapturePhoto service: VideoService) {
        
    }
    
    func videoService(_ service: VideoService, didCapturePhoto sampleBuffer: CVImageBuffer) {
        
    }
    
    func videoService(_ service: VideoService, didOutput buffer: CVPixelBuffer, with description: CMFormatDescription) {
        if !videoFilter.isPrepared {
            videoFilter.prepare(with: description, retainHint: 3)
        }
        guard let rendered = videoFilter.render(pixelBuffer: buffer) else {
            return
        }
        arView.pixelBuffer = rendered
    }
    
    
}
