//
//  space_gophersView.m
//  space-gophers
//
//  Created by Aleksandr Pasechnik on 7/24/17Mo.
//  CC BY-NC-SA 4.0
//

#import "space_gophersView.h"
#import "SGTwirlingLayer.h"

@implementation space_gophersView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {        
        [self setAnimationTimeInterval:1/30.0];
        
        // This bit is important. We can't use [NSBundle mainBundle]
        NSBundle *b = [NSBundle bundleForClass:[self class]];
        
        NSMutableArray *gs = [NSMutableArray array];
        for (NSString *name in @[@"astro-gopher-1", @"astro-gopher-2", @"astro-gopher-3", @"astro-gopher-4"]) {
            SGTwirlingLayer* l = [[SGTwirlingLayer alloc] init];
            NSImage *g = [b imageForResource:name];
            l.bounds = NSMakeRect(0, 0, g.size.width, g.size.height);
            l.contents = g;
            [gs addObject:l];
        }
        self.gophers = [NSArray arrayWithArray:gs];
        
        // Create a starfield image
        NSImage *s = [[NSImage alloc] initWithSize:frame.size];
        [s lockFocus];
        
        // Fill it with a space-y color
        [[NSColor colorWithCalibratedRed:0.05 green:0.1 blue:0.1 alpha:1.0] drawSwatchInRect:frame];
        
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
        
        // create a base starfield layer with the new image
        CALayer *starfieldLayer = [CALayer layer];
        starfieldLayer.bounds = self.frame;
        starfieldLayer.contents = s;
        
        // add the gophers as sublayers
        for (SGTwirlingLayer *g in self.gophers) {
            [starfieldLayer addSublayer:g];
        }
        
        // Go!
        
        [self setLayer:starfieldLayer];
        
        [self updateAnimations];
        
        [self setWantsLayer:YES];
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
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [self updateAnimations];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void)updateAnimations
{
    for (SGTwirlingLayer *gopher in self.gophers) {
        [gopher animateAtSecond:[[NSDate date] timeIntervalSinceReferenceDate]
                        InFrame:self.frame];
    }
}

@end
