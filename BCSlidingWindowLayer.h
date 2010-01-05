//
//  BCSlidingWindowLayer.h
//  ChiralX
//
//  Created by Jeremy Knope on 8/31/09.
//  Copyright 2009 Buttered Cat Software. All rights reserved.
//

#import <QuartzCore/CALayer.h>

@interface BCSlidingWindowLayer : CALayer {
	CALayer *spriteSheetLayer;
	CGImageRef spriteSheetImage;

	double age;
	
	NSUInteger currentFrame;
	CGSize frameSize;
	NSUInteger spriteRows;
	NSUInteger spriteColumns;
	NSUInteger frameCount;
}

@property(copy) NSString *imageName;
@property(assign) NSUInteger spriteColumns;
@property(assign) NSUInteger spriteRows;
@property(assign) NSUInteger frameCount;
@property(assign) NSUInteger currentFrame;

- (id)initWithCGImage:(CGImageRef)image frame:(CGRect)newFrame;
- (void)stepFrame;
- (void)updateWithInterval:(NSTimeInterval)timeInterval;

- (void)setCGImage:(CGImageRef)image;
- (CGImageRef)CGImage;
@end
