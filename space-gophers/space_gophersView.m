//
//  space_gophersView.m
//  space-gophers
//
//  Created by Aleksandr Pasechnik on 7/24/17Mo.
//  Copyright © 2017 Megamicron. All rights reserved.
//

#import "space_gophersView.h"
#import "SGSimulatedImage.h"

@implementation space_gophersView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    NSLog(@"gopher init (n)");
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        
        // This bit is important. We can't use [NSBundle mainBundle]
        NSBundle *b = [NSBundle bundleForClass:[self class]];
        
        NSImage *g = [b imageForResource:@"drawing-gopher.png"];
        
        self.gopher = [[SGSimulatedImage alloc] initWithImage:g];
    }
    
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
    return;
}

- (void)animateOneFrame
{
    [self.gopher drawAtSecond:0 InFrame:self.frame];
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
