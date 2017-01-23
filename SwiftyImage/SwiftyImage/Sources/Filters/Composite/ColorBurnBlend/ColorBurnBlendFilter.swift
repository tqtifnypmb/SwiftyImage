//
//  ColorBurnBlendFilter.swift
//  SwiftyImage
//
//  Created by tqtifnypmb on 15/12/2016.
//  Copyright © 2016 tqitfnypmb. All rights reserved.
//

import Foundation
import CoreGraphics

class ColorBurnBlendFilter: DualInputFilter {
    
    init(backgroundImage: CGImage) {
        super.init(secondInput: backgroundImage)
    }
    
    override func buildProgram() throws {
        _program = try Program.create(fragmentSourcePath: "ColorBurnBlendFragmentShader")
    }
    
    override var name: String {
        return "ColorBurnBlendFilter"
    }
}
