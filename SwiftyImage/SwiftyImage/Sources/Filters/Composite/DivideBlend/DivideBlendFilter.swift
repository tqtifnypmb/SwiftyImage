//
//  DivideBlendFilter.swift
//  SwiftyImage
//
//  Created by tqtifnypmb on 14/12/2016.
//  Copyright © 2016 tqitfnypmb. All rights reserved.
//

import Foundation
import CoreGraphics

class DivideBlendFilter: DualInputFilter {

    /**
     init a [Divide blend](https://en.wikipedia.org/wiki/Blend_modes) filter
     
        result = canvas / _otherImage_
     
     - parameter otherImage: specifies a other image
     */
    init(otherImage: CGImage) {
        super.init(secondInput: otherImage)
    }
    
    override func buildProgram() throws {
        _program = try Program.create(fragmentSourcePath: "DivideBlendFragmentShader")
    }
    
    override var name: String {
        return "DivideBlendFilter"
    }
}
