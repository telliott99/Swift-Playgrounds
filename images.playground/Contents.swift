import Cocoa

/*
https://mikeash.com/pyblog/friday-qa-2012-08-31-obtaining-and-interpreting-image-data.html

just dragged the image file to Resources ( showProject Navigator)

*/

let imgLoad = NSImage(named:"y.png")
let img = imgLoad!
img.className
img.size

// NSImage is a container for one or more image representations

img.representations.count
let imgRep = img.representations[0] as! NSBitmapImageRep
imgRep.className

/* 
typically each pixel is 4 bytes:  red, green, blue, alpha
other orderings are possible
also they can be stored separately:  that's called planar

above code is *not* a good way to get it b/c
we don't know what the pixel format is or how to handle cases

None of these work with this image:

imgRep.bitmapFormat
imgRep.bytesPerPlane
imgRep.bytesPerRow
imgRep.planar
imgRep.samplesPerPixel
let data = imgRep.bitMapData

*/

imgRep.bitsPerSample


// Using the bit map obtained in this way is
// "not reliable"
// what we do instead is to draw it
// assuming this size corresponds to pixels:

let w = Int(img.size.width)
let h = Int(img.size.height)

let imgRep2 = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: w,
    pixelsHigh: h,
    bitsPerSample: 8,
    samplesPerPixel: 4,
    hasAlpha: true,
    isPlanar: false,
    colorSpaceName: NSCalibratedRGBColorSpace,
    bytesPerRow: w * 4,
    bitsPerPixel: 32)

// unwrap it:
let ir = imgRep2!

// we need to draw the image into the bitmapRepresentation

let gc = NSGraphicsContext(bitmapImageRep: ir)
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.setCurrentContext(gc)

let op = NSCompositingOperation.CompositeCopy
let f = CGFloat(1.0)

// draw the image! not the imageRep
img.drawAtPoint(
    NSZeroPoint,
    fromRect: NSZeroRect,
    operation: op,
    fraction: f)

gc?.flushGraphics()
NSGraphicsContext.restoreGraphicsState()

// now we can use the imageRep
let data = ir.bitmapData
UInt8(data[0])
UInt8(data[1])
UInt8(data[2])
UInt8(data[3])  // alpha is 1.0
UInt8(data[4])
UInt8(data[5])
UInt8(data[6])
UInt8(data[7])

ir.CGImage

let data2 = ir.representationUsingType(
    .NSPNGFileType,
    properties: [:])

// b/c playgrounds are sandboxed we cannot write to Desktop
// data2!.writeToFile("out.png", atomically: true)





