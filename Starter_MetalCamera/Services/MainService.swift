//
//  MainService.swift
//  MyanmarTextScanner
//
//  Created by Aung Ko Min on 17/4/20.
//  Copyright © 2020 Aung Ko Min. All rights reserved.
//

import UIKit
import AVFoundation

final class MainService: ObservableObject {
    
    let metalView = CustomMetalView()
    private let videoService = VideoService()
    private let filterService = FilterService()
    private let visionService = VideoService()
    
    init() {
        videoService.delegate = self
    }

    deinit {
        stop()
    }
}

// Actions
extension MainService {
    func start() {
        videoService.start()
    }
    func stop() {
        
    }
    
    func updateFilter(_ filterType: FilterType) {
        filterService.updateFilter(filterType)
    }
}

// Video Service
extension MainService: VideoServiceDelegate {
    
    func videoService(_ service: VideoService, didOutput buffer: CVPixelBuffer, with description: CMFormatDescription) {
        metalView.pixelBuffer = filterService.filter(buffer, with: description)
    }
    
}
