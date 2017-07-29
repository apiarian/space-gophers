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
            
            self.rTimeScale = SSRandomFloatBetween(1.1, 1.6);
            self.rScale = SSRandomFloatBetween(1.9, 2.5);
            self.aScale = SSRandomFloatBetween(2.9, 3.9);
            self.aDirection = SSRandomFloatBetween(0, 1) < 0.5 ? -1 : 1;
            self.aPhase = SSRandomFloatBetween(2.1, 2.7);
            self.rotPhase = SSRandomFloatBetween(1.1, 1.9);
        }
        
        return self;
    }
    
    -(void)drawAtSecond:(double)t InFrame:(NSRect)frame {
        NSAffineTransform *xform = [NSAffineTransform transform];
        
        double w = frame.size.width;
        double h = frame.size.height;
        
        double time = t * 0.25;
        
        double r = w/2/self.rScale * cos(time) * sin(self.rTimeScale * time) + w/2/(0.85 * self.rScale);
        double a = self.aDirection * (self.aScale * sin(time) + self.aPhase * time);
        
        double x = r * cos(a);
        double y = r * sin(a);
        
        [xform translateXBy:x + w/2 + w/20 * cos(time)
                        yBy:y + h/2 + h/20 * sin(time)];
        
        [xform rotateByDegrees:100 * (time + self.rotPhase * cos(time))];
        
        [xform concat];
        
        [self.image drawAtPoint:NSMakePoint(self.image.size.width/-2, self.image.size.height/-2)
                       fromRect:NSZeroRect
                      operation:NSCompositingOperationSourceOver
                       fraction:1];
        
        [xform invert];
        [xform concat];
    }

@end
