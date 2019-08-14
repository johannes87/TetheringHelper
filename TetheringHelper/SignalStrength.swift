//
//  SignalStrengthImage.swift
//  TetheringHelper
//
//  Created by Johannes Bittner on 12.08.19.
//  Copyright © 2019 Johannes Bittner. All rights reserved.
//

import Cocoa

class SignalStrength {

    // https://stackoverflow.com/questions/12714923/os-x-icons-size
    let imageSize = NSSize.init(width: 18.0, height: 18.0)
    
    var image: NSImage
    
    init() {
        image = NSImage(size: imageSize, flipped: false, drawingHandler: {
            (dstRect: NSRect) -> Bool in
            
            let path = NSBezierPath()
            let point1 = NSPoint(x: NSMinX(dstRect), y: NSMinY(dstRect))
            let point2 = NSPoint(x: NSMaxX(dstRect), y: NSMaxY(dstRect))
            
            path.move(to: point1)
            path.line(to: point2)
            NSColor.black.setStroke()
            path.lineWidth = 0.25
            path.stroke()
            
            
            return true
        })
    }
    
    


}
