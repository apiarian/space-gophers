//
//  SGSimulatedImage.m
//  space-gophers
//
//  Created by Al Pasechnik on 7/25/17.
//  Copyright © 2017 Megamicron. All rights reserved.
//

#import "SGSimulatedImage.h"
#import <ScreenSaver/ScreenSaver.h>


@implementation SGSimulatedImage

    - (instancetype)initWithImage:(NSImage *)image {
        self = [super init];
        
        if (self) {
            self.image = image;
        }
        
        return self;
    }
    
    -(void)drawAtSecond:(double)t InFrame:(NSRect)frame {
        NSPoint p = NSMakePoint(frame.size.width/2, frame.size.height/2);
        
        NSAffineTransform *xform = [NSAffineTransform transform];
        
        [xform translateXBy:p.x yBy:p.y];
        
        [xform rotateByDegrees:3.0 * (t - (double)((int)t / 360))];
        [xform concat];
        
        [self.image drawAtPoint:NSMakePoint(self.image.size.width/-2, self.image.size.height/-2)
                       fromRect:NSZeroRect
                      operation:NSCompositingOperationSourceOver
                       fraction:1];
        
        [xform invert];
        [xform concat];
    }

@end
