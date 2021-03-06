//
//  ColorMatrixFilter.swift
//  Framenderer
//
//  Created by tqtifnypmb on 15/12/2016.
//  Copyright © 2016 tqitfnypmb. All rights reserved.
//

import Foundation
import OpenGLES.ES3.gl
import OpenGLES.ES3.glext

public class ColorBiasFilter: BaseFilter {
    
    /**
        init a color matrix filter
        
        Multiplies source color values and adds a bias factor to each color component.
     */
    public init(red: Float, green: Float, blue: Float, alpha: Float) {
        _red = GLfloat(red)
        _green = GLfloat(green)
        _blue = GLfloat(blue)
        _alpha = GLfloat(alpha)
    }
    private let _red: GLfloat
    private let _green: GLfloat
    private let _blue: GLfloat
    private let _alpha: GLfloat
    
    override func buildProgram() throws {
        _program = try Program.create(fragmentSourcePath: "ColorBiasFragmentShader")
    }
    
    override func setUniformAttributs(context: Context) {
        super.setUniformAttributs(context: context)
        
        _program.setUniform(name: "bias", color: [_red, _green, _blue, _alpha])
    }
    
    override public var name: String {
        return "ColorBiasFilter"
    }
}
