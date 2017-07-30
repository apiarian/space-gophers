//
//  SGTwirlingLayer.h
//  space-gophers
//
//  Created by Al Pasechnik on 7/25/17.
//  CC BY-NC-SA 4.0
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface SGTwirlingLayer : CALayer

@property double timeScale;
@property double rTimeScale;
@property double rScale;
@property double aScale;
@property double aPhase;
@property double rotPhase;
@property double aDirection;

-(void)animateAtSecond:(double)t InFrame:(NSRect)frame;
    
@end
