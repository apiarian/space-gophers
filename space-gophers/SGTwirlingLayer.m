//
//  SGTwirlingLayer.m
//  space-gophers
//
//  Created by Al Pasechnik on 7/25/17.
//  Copyright © 2017 Megamicron. All rights reserved.
//

#import "SGTwirlingLayer.h"
#import <ScreenSaver/ScreenSaver.h>


@implementation SGTwirlingLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.timeScale = SSRandomFloatBetween(0.20, 0.30);
        self.rTimeScale = SSRandomFloatBetween(1.1, 1.6);
        self.rScale = SSRandomFloatBetween(1.9, 2.5);
        self.aScale = SSRandomFloatBetween(2.9, 3.9);
        self.aDirection = SSRandomFloatBetween(0, 1) < 0.5 ? -1 : 1;
        self.aPhase = SSRandomFloatBetween(2.1, 2.7);
        self.rotPhase = SSRandomFloatBetween(1.1, 1.9);
    }
    return self;
}

-(NSPoint)pointAtSecond:(double)t InFrame:(NSRect)frame {
    double w = frame.size.width;
    double h = frame.size.height;
    
    double time = t * self.timeScale;
    
    double r = w/2/self.rScale * cos(time) * sin(self.rTimeScale * time) + w/2/(0.85 * self.rScale);
    double a = self.aDirection * (self.aScale * sin(time) + self.aPhase * time);
    
    double x = r * cos(a);
    double y = r * sin(a);
    
    return NSMakePoint(x + w/2 + w/20 * cos(time), y + h/2 + h/20 * sin(time));
}

-(double)rotationRadiansAtSecond:(double)t {
    double time = t * self.timeScale;
    
    double deg = 100 * (time + self.rotPhase * cos(time));
    
    return deg * M_PI / 180;
}

-(void)animateAtSecond:(double)t InFrame:(NSRect)frame {
    self.position = [self pointAtSecond:t InFrame:frame];
    self.transform = CATransform3DMakeRotation([self rotationRadiansAtSecond:t],
                                               0, 0, 1);
}

@end
