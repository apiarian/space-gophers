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
        NSPoint p = SSRandomPointForSizeWithinRect(self.image.size, frame);
        [self.image drawAtPoint:p fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1];
    }
@end
