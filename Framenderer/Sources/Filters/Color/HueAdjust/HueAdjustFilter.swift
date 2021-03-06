//
//  HueAdjustFilter.swift
//  Framenderer
//
//  Created by tqtifnypmb on 29/01/2017.
//  Copyright © 2017 tqitfnypmb. All rights reserved.
//

import UIKit

public class HueAdjustFilter: BaseFilter {
    public init(angle: Float = 0.0) {
        _angle = angle
    }
    private let _angle: GLfloat
    
    override func buildProgram() throws {
        _program = try Program.create(fragmentSourcePath: "HueAdjustFragmentShader")
    }
    
    override func setUniformAttributs(context: Context) {
        super.setUniformAttributs(context: context)
        
        _program.setUniform(name: "angle", value: _angle)
    }
    
    override public var name: String {
        return "HueAdjustFilter"
    }
}
