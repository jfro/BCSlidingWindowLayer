//
//  BCSlidingWindowLayerAppDelegate.m
//  BCSlidingWindowLayer
//
//  Created by Jeremy Knope on 1/4/10.
//  Copyright 2010 Buttered Cat Software. All rights reserved.
//

#import "BCSlidingWindowLayerAppDelegate.h"
#import "BCSlidingWindowLayer.h"

@implementation BCSlidingWindowLayerAppDelegate

@synthesize window;

- (CGImageRef)imageFromPath:(NSString *)path {
	NSURL*            url = [NSURL fileURLWithPath:path];
    CGImageRef        imageRef = NULL;
    CGImageSourceRef  sourceRef;
	
    sourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    if(sourceRef) {
        imageRef = CGImageSourceCreateImageAtIndex(sourceRef, 0, NULL);
        CFRelease(sourceRef);
    }
	
    return imageRef;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	CGImageRef image;
	CGRect frame = CGRectMake(20, 20, 128, 128);
	
	image = [self imageFromPath:[[NSBundle mainBundle] pathForResource:@"cube" ofType:@"png"]];
	if(!image)
	{
		NSLog(@"Failed to load sprite image");
		return;
	}
	sprite = [[BCSlidingWindowLayer alloc] initWithCGImage:image frame:frame];
	NSLog(@"Adding sprite to %@", [[window contentView] layer]);
	[[[window contentView] layer] addSublayer:sprite];
	
	// animation timer
	[NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (void)timerFired:(NSTimer *)timer
{
	[sprite stepFrame];
}

@end
