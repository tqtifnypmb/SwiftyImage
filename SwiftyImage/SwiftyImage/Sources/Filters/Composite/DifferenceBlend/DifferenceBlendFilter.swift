//
//  DifferenceBlendFilter.swift
//  SwiftyImage
//
//  Created by tqtifnypmb on 14/12/2016.
//  Copyright © 2016 tqitfnypmb. All rights reserved.
//

import Foundation
import CoreGraphics

class DifferenceBlendShader: DualInputFilter {
    
    /**
     init a [Difference blend](https://en.wikipedia.org/wiki/Blend_modes) filter
     
     result = canvas - _backgroundImage_
     
     - parameter backgroundImage: specifies a bakground image
     */
    init(backgroundImage: CGImage) {
        super.init(secondInput: backgroundImage)
    }
    
    override func buildProgram() throws {
        _program = try Program.create(fragmentSourcePath: "DifferenceBlendFragmentShader")
    }
    
    override var name: String {
        return "DifferenceBlendShader"
    }
}
