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
        
        NSMutableArray *gs = [NSMutableArray array];
        for (NSString *name in @[@"drawing-gopher", @"spacegirl-gopher"]) {
            [gs addObject:[[SGSimulatedImage alloc] initWithImage:[b imageForResource:name]]];
        }
        self.gophers = [NSArray arrayWithArray:gs];
        
        // Create a starfield image
        NSImage *s = [[NSImage alloc] initWithSize:frame.size];
        [s lockFocus];
        
        // Fill it with a space-y color
        [[NSColor colorWithCalibratedRed:0.1 green:0.2 blue:0.2 alpha:1.0] drawSwatchInRect:frame];
        
        // Add a bunch of stars
        for (int i = 0; i < 100; i++) {
            NSBezierPath* p = [NSBezierPath bezierPathWithOvalInRect:NSMakeRect(
                                                                                SSRandomFloatBetween(0, frame.size.width),
                                                                                SSRandomFloatBetween(0, frame.size.height),
                                                                                4, 4)];
            [p setLineWidth:2];
            [[NSColor whiteColor] setStroke];
            [[NSColor yellowColor] setFill];
            [p fill];
            [p stroke];
        }
        
        [s unlockFocus];
        self.starfield = s;
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
    [self.starfield drawInRect:self.frame];
    for (SGSimulatedImage *gopher in self.gophers) {
        [gopher drawAtSecond:[[NSDate date] timeIntervalSinceReferenceDate] InFrame:self.frame];
    }
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
