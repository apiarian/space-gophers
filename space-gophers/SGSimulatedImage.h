//
//  SGSimulatedImage.h
//  space-gophers
//
//  Created by Al Pasechnik on 7/25/17.
//  Copyright © 2017 Megamicron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGSimulatedImage : NSObject

@property NSImage *image;
@property double rTimeScale;
@property double rScale;
@property double aScale;
@property double aPhase;
@property double rotPhase;
@property double aDirection;


    -(instancetype)initWithImage:(NSImage *)image;
    
    -(void)drawAtSecond:(double)t InFrame:(NSRect)frame;
    
@end
