//
//  space_gophersView.m
//  space-gophers
//
//  Created by Aleksandr Pasechnik on 7/24/17Mo.
//  Copyright © 2017 Megamicron. All rights reserved.
//

#import "space_gophersView.h"

@implementation space_gophersView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    NSLog(@"gopher init (l)");
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    
    NSBundle *b = [NSBundle bundleForClass:[self class]];
    
    self.gopher = [b imageForResource:@"drawing-gopher.png"];

    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    NSPoint p = SSRandomPointForSizeWithinRect(self.gopher.size, self.frame);
    [self.gopher drawAtPoint:p fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1];
}

- (void)animateOneFrame
{
    [self setNeedsDisplay:TRUE];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
