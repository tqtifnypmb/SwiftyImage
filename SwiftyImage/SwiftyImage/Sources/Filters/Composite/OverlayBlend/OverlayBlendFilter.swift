//
//  OverlayBlendFilter.swift
//  SwiftyImage
//
//  Created by tqtifnypmb on 14/12/2016.
//  Copyright © 2016 tqitfnypmb. All rights reserved.
//

import Foundation
import CoreGraphics

class OverlayBlendFilter: DualInputFilter {
    
    /**
        init a [Overlay blend](https://en.wikipedia.org/wiki/Blend_modes) filter
        
        - parameter backgroundImage: specifies a image that's used as background
     */
    init(backgroundImage: CGImage) {
        super.init(secondInput: backgroundImage)
    }
    
    override func buildProgram() throws {
        _program = try Program.create(fragmentSourcePath: "OverlayBlendFragmentShader")
    }
}