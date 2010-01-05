//
//  BCSlidingWindowLayer.m
//  ChiralX
//
//  Created by Jeremy Knope on 8/31/09.
//  Copyright 2009 Buttered Cat Software. All rights reserved.
//

#import "BCSlidingWindowLayer.h"
#import "BCSpriteSheetLayer.h"

@interface BCSlidingWindowLayer(Private)
- (void)setupSpriteSheetLayer;
@end

@implementation BCSlidingWindowLayer

@synthesize imageName, spriteRows, spriteColumns, frameCount, currentFrame;

- (id)initWithCGImage:(CGImageRef)image frame:(CGRect)newFrame;
{
	if((self = [super init]))
	{
		self.spriteRows = 6;
		self.spriteColumns = 6;
		self.frameCount = 30;

		self.frame = newFrame;
		self.masksToBounds = YES; // we only want our little window on the larger sublayer
		age = 0;
		
		// TODO: random starting frame be optional
		currentFrame = rand() % self.frameCount;
		frameSize = CGSizeMake(newFrame.size.width, newFrame.size.height);
		
		spriteSheetLayer = nil;
		[self setCGImage:image];
	}
	return self;
}

- (void)dealloc
{
	[spriteSheetLayer release];
	CGImageRelease(spriteSheetImage);
	[super dealloc];
}

- (void)setCGImage:(CGImageRef)image
{
	CGImageRetain(image);
	CGImageRelease(spriteSheetImage);
	spriteSheetImage = image;
	[self setupSpriteSheetLayer];
}

- (CGImageRef)CGImage
{
	return spriteSheetImage;
}

- (CGPoint)locationForCurrentFrame
{
	NSInteger col, row;
	CGPoint newLocation;
	
	col = (currentFrame % self.spriteColumns);
	row = (currentFrame / self.spriteRows);
	
	newLocation.x = -(col * frameSize.width);
	newLocation.y = -(row * frameSize.height);
	return newLocation;
}

- (void)setupSpriteSheetLayer
{
	if(!spriteSheetLayer)
	{
		spriteSheetLayer = [[[BCSpriteSheetLayer alloc] init] autorelease];
		[self addSublayer:spriteSheetLayer];
	}
	
	// get our starting point, as we can start on a random frame
	CGPoint p = [self locationForCurrentFrame];
	
	// probably could just ask CGImage for it's size?
	CGRect rect = CGRectMake(p.x, p.y, self.spriteColumns * frameSize.width, self.spriteRows * frameSize.height);
	
	spriteSheetLayer.frame = rect;
	spriteSheetLayer.contents = (id)spriteSheetImage; // it only seems to like CGImage but expects id
}

- (void)stepFrame
{
	CGPoint newLocation;
	currentFrame = (currentFrame + 1) % self.frameCount;
	newLocation = [self locationForCurrentFrame];
	CGRect newRect = spriteSheetLayer.frame;
	newRect.origin = newLocation;
	spriteSheetLayer.frame = newRect;
}

// TODO: setup the layer having its own fps timing as seen in Cocoa With Love example
- (void)updateWithInterval:(NSTimeInterval)timeInterval
{
	[self stepFrame];
}
@end
